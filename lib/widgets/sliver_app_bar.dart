import 'package:flutter/material.dart';

import '../app_images.dart';

class SliverAppBer extends StatelessWidget {
  final Widget widget;
  final Widget NavBar;
  final Widget title;
  const SliverAppBer({
    Key? key,
    required this.title,
    required this.widget,
    required this.NavBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black87,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
                title: title,
                centerTitle: true,
                background: const Image(
                  image: AssetImage(AppImages.bacgrountSliver),
                  fit: BoxFit.cover,
                )),
            floating: true,
            pinned: true,
            actions: [],
          ),
          widget
        ],
      ),
    );
  }
}
