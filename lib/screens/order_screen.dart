import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testfff/api_client/api_client.dart';
import '../blocs/order/order_bloc.dart';
import '../modal/card_product.dart';
import '../modal/order_product.dart';
import '../modal/product_modal.dart';
import '../widgets/title_widget.dart';

class OrderScreen extends StatelessWidget {
  final List<Product> cardProduct;
  const OrderScreen({Key? key, required this.cardProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Оформление заказа')),
      body: OrderWidget(
        cardProduct: cardProduct,
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  final List<Product> cardProduct;
  const OrderWidget({Key? key, required this.cardProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final countryController = TextEditingController();
    final cityController = TextEditingController();
    final adresController = TextEditingController();

    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const TitleWidget(
                title: 'Контактная информация',
                color: Colors.black,
              ),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  hintText: 'Фамилия',
                ),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: 'Имя',
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Телефон',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const TitleWidget(
                title: 'Информация о доставке',
                color: Colors.black,
              ),
              TextField(
                controller: countryController,
                decoration: const InputDecoration(
                  hintText: 'Страна',
                ),
              ),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  hintText: 'Город',
                ),
              ),
              TextField(
                controller: adresController,
                decoration: const InputDecoration(
                  hintText: 'Адрес',
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                  onPressed: () {
                    final firstName = firstNameController.text;
                    final lastName = lastNameController.text;
                    final email = emailController.text;
                    final phone = phoneController.text;
                    final country = countryController.text;
                    final city = cityController.text;
                    final adres = adresController.text;

                    BlocProvider.of<OrderBloc>(context).add(CreateOrder(
                        adres: adres,
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        phone: phone,
                        country: country,
                        city: city,
                        postCode: '140033',
                        cardProduct: cardProduct));
                  },
                  child: const Text('Отправить заказ Bloc')),
            ],
          ),
        )
      ],
    );
  }
}
