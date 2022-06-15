import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api_client/api_client.dart';
import '../blocs/details_product/details_product_bloc.dart';
import '../blocs/product_card/product_card_bloc.dart';
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                              child: Text('Сделать заказ')),
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
                  itemCount: state.productCard.products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.productCard.products[index].name),
                                Text('${state.productCard.totalPrise}')
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        'home_screen/card_screen/order',
                        arguments: state.productCard.products);
                  },
                  child: const Text('Оформить заказ'))
            ],
          );
        }

        return Container();
      },
    );
  }
}
