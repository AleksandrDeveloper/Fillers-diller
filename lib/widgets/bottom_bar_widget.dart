import 'package:flutter/material.dart';
import '../storage/is_autf_pref.dart';
import '../modal/my_app_modal.dart';

class BottomBarWidget extends StatelessWidget with PreferredSizeWidget {
  BottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pref = IsAuthPrefProvider();
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black87],
          ),
        ),
        width: 100,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('home_screen');
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('home_screen/card_screen');
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                await pref.deleteAuth();
                Navigator.of(context)
                    .pushNamed('home_screen/product_screen/wishlist_screen');
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                await pref.deleteAuth();
                Navigator.of(context).pushNamed('splash');
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}