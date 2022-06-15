import 'package:flutter/material.dart';

class NoProductWidget extends StatelessWidget {
  final String title;

  const NoProductWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Добавьте сюда интересующие товары',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('home_screen'),
            child: Container(
              height: 50,
              width: 200,
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
              child: const Center(
                child: Text(
                  'Вернуться в каталог',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
