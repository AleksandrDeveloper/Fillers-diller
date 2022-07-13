import 'package:flutter/material.dart';

class NoProductWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool bottomTrue;

  const NoProductWidget({
    required this.title,
    required this.subTitle,
    required this.bottomTrue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 170),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          bottomTrue == true
              ? GestureDetector(
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
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.black87,
                        ],
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
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
