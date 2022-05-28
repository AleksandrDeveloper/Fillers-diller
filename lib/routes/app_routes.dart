import 'package:flutter/cupertino.dart';

import '../screens/auth_screen.dart';
import '../screens/category_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_card_screen.dart';
import '../screens/product_screen.dart';
import '../screens/search_product.dart';
import '../screens/splash_screen.dart';
import '../screens/user_screen.dart';
import '../screens/wishlist_screen.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
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
  };
}
