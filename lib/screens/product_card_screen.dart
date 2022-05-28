import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/details_product/details_product_bloc.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/product_card_max.dart';
import '../widgets/sliver_app_bar.dart';

class ProductCardScreen extends StatelessWidget {
  const ProductCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverAppBer(
        title: const Text('Корзина'),
        widget: buildScreen(),
        NavBar: BottomAppBar(
          color: Colors.black,
          elevation: 0,
          child: BlocBuilder<DetailsProductBloc, DetailsProductState>(
            builder: (context, state) {
              if (state is DetailsProductLoaded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<WishlistBloc>(context)
                            .add(AddProductWishlist(
                          context: context,
                          product: state.detailsProducts,
                        ));
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text('Добавить в корзину')),
                        ),
                      ),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

Widget buildScreen() => const SliverToBoxAdapter(
      child: ProductCardWidget(),
    );

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCardBloc, ProductCardState>(
      builder: (context, state) {
        if (state is ProductCardLoading) {
          return const CircularProgressIndicator(
            color: Colors.red,
          );
        }
        if (state is ProductCardLoaded) {
          return ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: state.productCardBloc.length,
                    itemBuilder: (context, index) {
                      return ProductCardMax(
                        index: index,
                        product: state.productCardBloc[index],
                        widget: IconButton(
                          onPressed: () {
                            BlocProvider.of<ProductCardBloc>(context).add(
                              DeleteProductToCard(
                                  product: state.productCardBloc[index]),
                            );
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Подытог'),
                  Text('${state.subtotal}'),
                ],
              )
            ],
          );
        }

        return Container();
      },
    );
  }
}
