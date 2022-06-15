import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../widgets/no_product.dart';
import '../widgets/sliver_app_bar.dart';

class ProductCardScreen extends StatelessWidget {
  const ProductCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCardBloc, ProductCardState>(
        builder: (context, state) {
      if (state is ProductCardLoading) {
        return Scaffold(
            body: SliverAppBer(
                title: const Text('Корзина'),
                widget: buildScreenTwo(),
                NavBar: const SizedBox()));
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
Widget buildScreenTwo() => const SliverToBoxAdapter(
      child: NoProductWidget(title: 'Корзина пуста'),
    );

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCardBloc, ProductCardState>(
      builder: (context, state) {
        if (state is ProductCardLoading) {
          return const NoProductWidget(title: 'Корзина пуста');
        }
        if (state is ProductCardLoaded) {
          return state.productCard.products.length < 0
              ? const NoProductWidget(title: 'Корзина пуста')
              : ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: ListView.builder(
                        itemCount: state.productCard.products.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: const ValueKey(0),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              dismissible: DismissiblePane(onDismissed: () {}),
                              children: const [
                                SlidableAction(
                                  onPressed: null,
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Удалить',
                                ),
                              ],
                            ),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 230,
                                            child: Text(
                                              state.productCard.products[index]
                                                  .name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              ProductCardBloc>(
                                                          context)
                                                      .add(RemuveQuntity(
                                                    product: state.productCard
                                                        .products[index],
                                                  ));
                                                  print(
                                                      'это curent quntity ${state.productCard.products[index].quntity}');
                                                },
                                                icon: const Icon(Icons.remove)),
                                            Text(
                                                '${state.productCard.products[index].quntity}'),
                                            IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              ProductCardBloc>(
                                                          context)
                                                      .add(PudQuntity(
                                                    product: state.productCard
                                                        .products[index],
                                                  ));
                                                  print(
                                                      'это curent quntity ${state.productCard.products[index].quntity}');
                                                },
                                                icon: const Icon(Icons.add)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
                            Text(' Общая сумма = ${state.newQuntity}'),
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
