import 'package:flutter/material.dart';

class TextFieldAuthWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final bool obscureText;
  const TextFieldAuthWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade200),
          child: Center(
            child: TextField(
              obscureText: obscureText,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                prefixIcon: icon,
              ),
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}
