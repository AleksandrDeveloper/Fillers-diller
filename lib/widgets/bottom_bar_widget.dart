import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user/user_bloc.dart';

class BottomBarWidget extends StatelessWidget with PreferredSizeWidget {
  BottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(35.0)),
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black87],
          ),
        ),
        width: 100,
        height: 70,
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
              onPressed: () {
                Navigator.of(context).pushNamed('home_screen/card_screen');
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('home_screen/product_screen/wishlist_screen');
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('home_screen/search_product');
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context)
                    .add(AddUser(context: context));
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
