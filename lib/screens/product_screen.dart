import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/details_product/details_product_bloc.dart';
import '../blocs/product_card/product_card_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
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
                      onTap: () {
                        BlocProvider.of<ProductCardBloc>(context).add(
                          AddProductToCard(product: state.detailsProducts),
                        );
                      },
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black87,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: BlocBuilder<DetailsProductBloc, DetailsProductState>(
                builder: (context, state) {
                  if (state is DetailsProductLoading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.red));
                  }
                  if (state is DetailsProductLoaded) {
                    return Image.network(
                      state.detailsProducts.images[0].src,
                      fit: BoxFit.cover,
                    );
                  }
                  if (state is DetailsProductError) {
                    return Center(
                      child: Text(state.errrorMasage),
                    );
                  }
                  return Container();
                },
              ),
            ),
            floating: true,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed('home_screen/product_screen/wishlist_screen'),
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          buildScreen()
        ],
      ),
    );
  }
}

Widget buildScreen() => const SliverToBoxAdapter(
      child: ProductScreenWidget(),
    );

class ProductScreenWidget extends StatelessWidget {
  const ProductScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsProductBloc, DetailsProductState>(
      builder: (context, state) {
        if (state is DetailsProductLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        }
        if (state is DetailsProductLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.detailsProducts.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            state.detailsProducts.regularPrice,
                            style: const TextStyle(
                                decorationColor: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            state.detailsProducts.regularPrice,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      Text(state.detailsProducts.descriptionHtml),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is DetailsProductError) {
          return Center(
            child: Text(state.errrorMasage),
          );
        }

        return Container();
      },
    );
  }
}
