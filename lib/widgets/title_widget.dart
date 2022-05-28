import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Color? color;

  const TitleWidget({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Text(title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            )),
      ),
    );
  }
}
