import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_card/product_card_bloc.dart';

import '../widgets/bottom_bar_widget.dart';
import '../widgets/sliver_app_bar.dart';

class ProductCardScreen extends StatelessWidget {
  const ProductCardScreen({Key? key}) : super(key: key);

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
        return Scaffold(
            body: SliverAppBer(
                title: const Text('Корзина'),
                widget: buildScreen(),
                NavBar: const SizedBox()));
      }
      return Container();
    });
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
          return Center(
            child: Container(
              width: 100,
              height: 100,
              child: const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        }
        if (state is ProductCardLoaded) {
          return ListView(
            primary: false,
            shrinkWrap: true,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView.builder(
                  itemCount: state.productCard.products.length,
                  itemBuilder: (context, index) {
                    int quntityProduct = 1;

                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 230,
                                    child: Text(
                                      state.productCard.products[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          quntityProduct -= state.productCard
                                              .products[index].quntity;
                                          print(quntityProduct);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text('${quntityProduct}'),
                                    IconButton(
                                        onPressed: () {
                                          quntityProduct += state.productCard
                                              .products[index].quntity;
                                          print(quntityProduct);
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              'home_screen/card_screen/order',
                              arguments: state.productCard.products);
                        },
                        child: const Text('Оформить заказ'),
                      ),
                      Text(' Общая сумма = ${state.productCard.totalPrise}'),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
