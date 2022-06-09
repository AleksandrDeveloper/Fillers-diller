import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testfff/blocs/search_product/search_product_bloc.dart';
import 'package:testfff/blocs/category_product/category_product_bloc.dart';
import 'package:testfff/routes/app_routes.dart';
import 'blocs/all_category/all_category_bloc.dart';
import 'blocs/all_product/all_product_bloc.dart';
import 'blocs/details_product/details_product_bloc.dart';
import 'blocs/order/order_bloc.dart';
import 'blocs/product_card/product_card_bloc.dart';
import 'blocs/splashScreen/splashscreen_bloc.dart';
import 'blocs/user/user_bloc.dart';
import 'blocs/wishlist/wishlist_bloc.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = AppRoutes();
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromRGBO(244, 244, 244, 1),
        ),
        initialRoute: navigator.initialRoutes,
        routes: navigator.routes);
  }
}



//  final productId = ModalRoute.of(context)!.settings.arguments as int;