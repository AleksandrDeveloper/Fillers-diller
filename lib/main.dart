import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testfff/blocs/search_product/search_product_bloc.dart';
import 'package:testfff/blocs/category_product/category_product_bloc.dart';
import 'blocs/all_category/all_category_bloc.dart';
import 'blocs/all_product/all_product_bloc.dart';
import 'blocs/details_product/details_product_bloc.dart';
import 'blocs/order/order_bloc.dart';
import 'blocs/product_card/product_card_bloc.dart';
import 'blocs/splashScreen/splashscreen_bloc.dart';
import 'blocs/user/user_bloc.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'config/my_app.dart';

void main() async {
  await Hive.initFlutter();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AllProductBloc>(create: (context) => AllProductBloc()),
    BlocProvider<AllCategoryBloc>(create: (context) => AllCategoryBloc()),
    BlocProvider<DetailsProductBloc>(create: (context) => DetailsProductBloc()),
    BlocProvider<SearchProductBloc>(create: (context) => SearchProductBloc()),
    BlocProvider<WishlistBloc>(create: (context) => WishlistBloc()),
    BlocProvider<UserBloc>(create: (context) => UserBloc()),
    BlocProvider<SplashscreenBloc>(create: (context) => SplashscreenBloc()),
    BlocProvider<ProductCardBloc>(create: (context) => ProductCardBloc()),
    BlocProvider<OrderBloc>(create: (context) => OrderBloc()),
    BlocProvider<CategoryProductBloc>(
        create: (context) => CategoryProductBloc()),
  ], child: const MyApp()));
}
