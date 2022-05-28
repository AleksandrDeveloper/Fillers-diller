import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testfff/blocs/search_product/search_product_bloc.dart';
import 'package:testfff/blocs/category_product/category_product_bloc.dart';
import 'package:testfff/screens/category_screen.dart';
import 'package:testfff/screens/product_card_screen.dart';
import 'package:testfff/screens/search_product.dart';
import 'package:testfff/screens/user_screen.dart';
import 'package:testfff/screens/wishlist_screen.dart';
import 'blocs/all_category/all_category_bloc.dart';
import 'blocs/all_product/all_product_bloc.dart';
import 'blocs/details_product/details_product_bloc.dart';
import 'blocs/splashScreen/splashscreen_bloc.dart';
import 'blocs/user/user_bloc.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'screens/product_screen.dart';
import 'screens/sreens.dart';

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
    BlocProvider<CategoryProductBloc>(
        create: (context) => CategoryProductBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      ),
      initialRoute: 'splash',
      routes: {
        'splash': ((context) => const SplashScreenWidget()),
        'auth': ((context) => const AuthWigget()),
        'home_screen': (context) => const HomeScreen(
              title: 'Fillers Diller',
            ),
        'home_screen/search_product': (context) {
          return const SearchProduct();
        },
        'home_screen/product_screen': (context) {
          return const ProductScreen();
        },
        'home_screen/category_screen': (context) {
          return const CategoryScreen();
        },
        'home_screen/user_screen': (context) {
          return const UserScreen();
        },
        'home_screen/card_screen': (context) {
          return const ProductCardScreen();
        },
        'home_screen/product_screen/wishlist_screen': ((context) {
          return const WishlistScreen();
        }),
      },
    );
  }
}



//  final productId = ModalRoute.of(context)!.settings.arguments as int;