import 'package:flutter/material.dart';

import 'widgets.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordOneController;
  final TextEditingController passwordTwoController;
  const FormWidget({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordOneController,
    required this.passwordTwoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldRegistWidget(
          controller: nameController,
          hintText: 'Ваше имя',
          obscureText: false,
          errorText: 'name',
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        TextFieldRegistWidget(
          controller: emailController,
          hintText: 'Email',
          obscureText: false,
          errorText: 'email',
          icon: const Icon(
            Icons.mail,
            color: Colors.black,
          ),
        ),
        TextFieldRegistWidget(
          controller: passwordOneController,
          hintText: 'Пароль',
          obscureText: true,
          errorText: 'passwordOne',
          icon: const Icon(
            Icons.key,
            color: Colors.black,
          ),
        ),
        TextFieldRegistWidget(
          controller: passwordTwoController,
          hintText: 'Повторите пароль',
          obscureText: true,
          errorText: 'passwordTwo',
          icon: const Icon(
            Icons.key,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
