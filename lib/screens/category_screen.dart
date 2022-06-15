import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/category_product/category_product_bloc.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/product_card_max.dart';
import '../widgets/sliver_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBer(
      widget: buildScreen(),
      title: const Text('Каталог'),
      NavBar: BottomBarWidget(),
    );
  }
}

Widget buildScreen() => const SliverToBoxAdapter(
      child: CategoryScreenWidget(),
    );

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
