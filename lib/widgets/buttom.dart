import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  final String title;
  const Buttom({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Colors.black, Colors.black87],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}
