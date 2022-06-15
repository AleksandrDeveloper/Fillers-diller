import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../blocs/search_product/search_product_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/product_card_max.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/sliver_app_bar.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverAppBer(
        title: const SearchAppBar(),
        widget: buildScreen(),
        NavBar: BottomBarWidget(),
      ),
    );
  }
}

Widget buildScreen() => const SliverToBoxAdapter(
      child: SearchProductWidget(),
    );

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        if (state is SearchProductLoading) {
          return const CircularProgressIndicator(
            color: Colors.red,
          );
        }
        if (state is SearchProductLoaded) {
          return Column(
            children: [
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: state.searchProduct.length,
                itemBuilder: (context, index) {
                  return ProductCardMax(
                    widgetTwo: IconButton(
                      onPressed: () {
                        BlocProvider.of<WishlistBloc>(context).add(
                          AddProductWishlist(
                              context: context,
                              product: state.searchProduct[index]),
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
                      icon:
                          const Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                    index: index,
                    product: state.searchProduct[index],
                  );
                },
              ),
            ],
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
