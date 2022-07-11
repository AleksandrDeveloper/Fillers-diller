import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/product_card_max.dart';
import '../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Wishlist',
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
      body: const WishlistScreenWidget(),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}

class WishlistScreenWidget extends StatelessWidget {
  const WishlistScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoading) {
          return const Center(
            child: NoProductWidget(
              title: 'Wishlist пуст',
              bottomTrue: true,
              subTitle: 'Добавьте сюда интересующие товары',
            ),
          );
        }
        if (state is WishlistLoaded) {
          Column(
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
