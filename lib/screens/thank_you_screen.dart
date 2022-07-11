import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NoProductWidget(
          title: 'Спасибо',
          subTitle:
              'Ваш заказ отправлен. В течение 10 минут с вами свяжется менеджер',
          bottomTrue: true,
        ),
      ),
    );
  }
}
