import 'package:flutter/cupertino.dart';
import '../modal/product_modal.dart';
import '../screens/category_screen.dart';
import '../screens/order_screen.dart';
import '../screens/product_card_screen.dart';
import '../screens/product_screen.dart';
import '../screens/search_product.dart';
import '../screens/sreens.dart';
import '../screens/user_screen.dart';
import '../screens/wishlist_screen.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
    'splash': ((context) => const SplashScreenWidget()),
    'auth': ((context) => const AuthScreenWidget()),
    'auth/registration': ((context) => const RegistrationScreenWidget()),
    'home_screen': (context) => const HomeScreen(),
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
    'order/thank_screen': (context) {
      return const ThankYouScreen();
    },
    'home_screen/card_screen/order': (context) {
      final cartProductT =
          ModalRoute.of(context)!.settings.arguments as List<Product>;

      return OrderScreen(cardProduct: cartProductT);
    },
    'home_screen/product_screen/wishlist_screen': ((context) {
      return const WishlistScreen();
    }),
  };
  final String initialRoutes = 'splash';
}
