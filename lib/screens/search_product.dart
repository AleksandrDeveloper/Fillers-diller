import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../blocs/search_product/search_product_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/product_card_max.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/widgets.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Поиск',
        widget: const SearchAppBar(),
        iconLeft: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: const SearchProductWidget(),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        if (state is SearchProductLoading) {
          return const Center(
            child: NoProductWidget(
              title: 'Список пуст',
              bottomTrue: false,
              subTitle:
                  'Веедите в поисковую строку название интересующего товара',
            ),
          );
        }
        if (state is SearchProductLoaded) {
          return ListView.builder(
            itemCount: state.searchProduct.length,
            itemBuilder: (context, index) {
              return ProductCardMax(
                widgetTwo: IconButton(
                  onPressed: () {
                    BlocProvider.of<WishlistBloc>(context).add(
                      AddProductWishlist(
                        context: context,
                        product: state.searchProduct[index],
                      ),
                    );
                  },
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
                widget: IconButton(
                  onPressed: () {
                    BlocProvider.of<ProductCardBloc>(context).add(
                      AddProductToCard(product: state.searchProduct[index]),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                ),
                index: index,
                product: state.searchProduct[index],
              );
            },
          );
        }
        if (state is SearchProductError) {
          return Center(child: Text(state.title));
        }

        return Container();
      },
    );
  }
}
