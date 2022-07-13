import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/category_product/category_product_bloc.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/product_card_max.dart';
import '../widgets/widgets.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductBloc, CategoryProductState>(
      builder: (context, state) {
        if (state is CategoryProductLoaded) {
          return Scaffold(
            appBar: AppBarWidget(
              title: state.categoryProduct.first.categories.first.name,
              widget: const SizedBox.shrink(),
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
            body: const CategoryScreenWidget(),
            bottomNavigationBar: BottomBarWidget(),
          );
        }
        return Container();
      },
    );
  }
}

class CategoryScreenWidget extends StatelessWidget {
  const CategoryScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductBloc, CategoryProductState>(
      builder: (context, state) {
        if (state is CategoryProductLoading) {
          return const CircularProgressIndicator(
            color: Colors.red,
          );
        }
        if (state is CategoryProductLoaded) {
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: state.categoryProduct.length,
            itemBuilder: (context, index) {
              return ProductCardMax(
                widgetTwo: IconButton(
                  onPressed: () {
                    BlocProvider.of<WishlistBloc>(context).add(
                      AddProductWishlist(
                          context: context,
                          product: state.categoryProduct[index]),
                    );
                  },
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
                widget: IconButton(
                  onPressed: () {
                    BlocProvider.of<ProductCardBloc>(context).add(
                      AddProductToCard(product: state.categoryProduct[index]),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                ),
                index: index,
                product: state.categoryProduct[index],
              );
            },
          );
        }
        if (state is CategoryProductError) {
          return Center(
            child: Text(state.errorMassage),
          );
        }
        return Container();
      },
    );
  }
}
