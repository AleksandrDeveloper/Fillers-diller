import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../widgets/buttom.dart';
import '../widgets/widgets.dart';

class ProductCardScreen extends StatelessWidget {
  const ProductCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Корзина',
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
      body: const ProductCardWidget(),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCardBloc, ProductCardState>(
      builder: (context, state) {
        if (state is ProductCardLoading) {
          return const Center(
            child: NoProductWidget(
              title: 'Корзина пуста',
              bottomTrue: true,
              subTitle: 'Добавьте сюда интересующие товары',
            ),
          );
        }
        if (state is ProductCardLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                Text(
                  'В корзине товаров ${state.productCard.products.length}',
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    itemCount: state.productCard.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slidable(
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        state.productCard.products[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                      height: 37,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
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
                                            '${state.productCard.products[index].quntity}',
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              ' Общая сумма',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('  ${state.newQuntity} руб',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                              'home_screen/card_screen/order',
                              arguments: state.productCard.products),
                          child: const Buttom(
                            title: 'Оформить заказ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
