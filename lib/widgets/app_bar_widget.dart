import 'package:flutter/material.dart';
import 'package:testfff/main.dart';

import '../app_images.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget widget;
  const AppBarWidget({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bacgrountSliver),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xffffffff),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            widget,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}
