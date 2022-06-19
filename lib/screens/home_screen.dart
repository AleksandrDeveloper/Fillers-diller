import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfff/blocs/all_product/all_product_bloc.dart';
import '../blocs/all_category/all_category_bloc.dart';
import '../blocs/search_product/search_product_bloc.dart';
import '../blocs/category_product/category_product_bloc.dart';
import '../modal/product_modal.dart';
import '../widgets/product_card.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/sliver_app_bar.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CategoryListWidget();
  }
}

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key}) : super(key: key);
  void getProduct({required BuildContext context}) {
    BlocProvider.of<AllProductBloc>(context).add(GetAllProduct());
    BlocProvider.of<AllCategoryBloc>(context).add(GetAllCategory());
  }

  @override
  Widget build(BuildContext context) {
    getProduct(context: context);
    return Scaffold(
      body: SliverAppBer(
        widget: buildScreen(),
        title: const Text('Fillers Diller'), //const SearchAppBar()
        NavBar: BottomBarWidget(),
      ),
    );
  }
}

Widget buildScreen() => const SliverToBoxAdapter(
      child: HomeScreenWidget(),
    );

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const TitleWidget(
                title: 'Популярные категории',
                color: Colors.black,
              ),
              BlocBuilder<AllCategoryBloc, AllCategoryState>(
                builder: (context, state) {
                  if (state is CategoryProductLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.red,
                    );
                  }
                  if (state is AllCategoryLoaded) {
                    return SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.category.length,
                        itemBuilder: (BuildContext context, index) {
                          return CategoryCardWidget(
                            index: index,
                            category: state.category[index],
                          );
                        },
                      ),
                    );
                  }
                  if (state is AllCategoryError) {
                    return Text(state.errorMassage);
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const TitleWidget(
                title: 'Рекомендуемые товары',
                color: Colors.black,
              ),
              BlocBuilder<AllProductBloc, AllProductState>(
                  builder: (context, state) {
                if (state is AllProductLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.red,
                  );
                }
                if (state is AllProductLoaded) {
                  return BlocListProductFeatured(
                      product: List.from(
                    state.productFeatured,
                  ));
                }
                if (state is AllProductError) {
                  return Text(state.errorMassage);
                }
                return Container();
              }),
              const TitleWidget(
                title: 'Товары по акции',
                color: Colors.black,
              ),
              BlocBuilder<AllProductBloc, AllProductState>(
                  builder: (context, state) {
                if (state is AllProductLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.red,
                  );
                }
                if (state is AllProductLoaded) {
                  return BlocListProductOnSale(
                      product: List.from(
                    state.productOnSale,
                  ));
                }
                if (state is AllProductError) {
                  return Text(state.errorMassage);
                }
                return Container();
              }),
            ],
          ),
        ),
      ],
    );
  }
}

class BlocListProductFeatured extends StatelessWidget {
  List<Product> product;

  BlocListProductFeatured({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductBloc, AllProductState>(
        builder: (context, state) {
      if (state is AllProductLoading) {
        return const CircularProgressIndicator(
          color: Colors.red,
        );
      }
      if (state is AllProductLoaded) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.length,
            itemBuilder: (BuildContext context, index) {
              return ProductCardWidget(
                index: index,
                product: state.productFeatured[index],
              );
            },
          ),
        );
      }
      if (state is AllProductError) {
        return Text(state.errorMassage);
      }
      return Container();
    });
  }
}

class BlocListProductOnSale extends StatelessWidget {
  List<Product> product;

  BlocListProductOnSale({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductBloc, AllProductState>(
        builder: (context, state) {
      if (state is AllProductLoading) {
        return const CircularProgressIndicator(
          color: Colors.red,
        );
      }
      if (state is AllProductLoaded) {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product.length,
            itemBuilder: (BuildContext context, index) {
              return ProductCardWidget(
                index: index,
                product: state.productOnSale[index],
              );
            },
          ),
        );
      }
      if (state is AllProductError) {
        return Text(state.errorMassage);
      }
      return Container();
    });
  }
}
