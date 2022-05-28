import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/product_card_max.dart';
import '../widgets/sliver_app_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBer(
      widget: buildScreen(),
      title: const Text('Wishlist'),
      NavBar: BottomBarWidget(),
    );
  }
}

Widget buildScreen() => const SliverToBoxAdapter(
      child: WishlistScreenWidget(),
    );

class WishlistScreenWidget extends StatelessWidget {
  const WishlistScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoading) {
          return const NoProductWidget();
        }
        if (state is WishlistLoaded) {
          return state.wishlistProduct.length <= 0
              ? const NoProductWidget()
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.wishlistProduct.length,
                  itemBuilder: (context, index) {
                    return ProductCardMax(
                      widget: IconButton(
                          onPressed: () {
                            BlocProvider.of<WishlistBloc>(context).add(
                                RemoveProductWishlist(
                                    context: context,
                                    product: state.wishlistProduct[index]));
                          },
                          icon: const Icon(Icons.delete, color: Colors.red)),
                      index: index,
                      product: state.wishlistProduct[index],
                    );
                  });
        }
        if (state is WishlistError) {
          return Center(
            child: Text(state.errorMassage),
          );
        }
        return Container();
      },
    );
  }
}

class NoProductWidget extends StatelessWidget {
  const NoProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Wishlist пуст',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Добавьте сюда интересующие товары',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('home_screen'),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.black87],
                ),
              ),
              child: const Center(
                child: Text(
                  'Вернуться в каталог',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
