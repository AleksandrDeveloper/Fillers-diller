import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/bottom_bar_widget.dart';
import '../widgets/no_product.dart';
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
          return const NoProductWidget(
            title: 'Wishlist пуст',
          );
        }
        if (state is WishlistLoaded) {
          return state.wishlistProduct.length <= 0
              ? const NoProductWidget(
                  title: 'Wishlist пуст',
                )
              : Column(
                  children: [
                    ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: state.wishlistProduct.length,
                        itemBuilder: (context, index) {
                          return ProductCardMax(
                            widgetTwo: IconButton(
                              onPressed: () {
                                BlocProvider.of<WishlistBloc>(context).add(
                                  RemoveProductWishlist(
                                      context: context,
                                      product: state.wishlistProduct[index]),
                                );
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                            widget: IconButton(
                              onPressed: () {
                                BlocProvider.of<WishlistBloc>(context).add(
                                  RemoveProductWishlist(
                                      context: context,
                                      product: state.wishlistProduct[index]),
                                );
                              },
                              icon: const Icon(Icons.shopping_cart,
                                  color: Colors.white),
                            ),
                            index: index,
                            product: state.wishlistProduct[index],
                          );
                        }),
                  ],
                );
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
