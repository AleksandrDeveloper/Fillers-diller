import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/registration/registration_bloc.dart';
import '../config/app_images.dart';
import '../widgets/widgets.dart';

class RegistrationScreenWidget extends StatelessWidget {
  const RegistrationScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordOneController = TextEditingController();
    final passwordTwoController = TextEditingController();
    final nameController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bacgrountAuth), fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ZoomIn(
                      child: const Image(
                        width: 250,
                        image: AssetImage(AppImages.logo),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    FormWidget(
                      emailController: emailController,
                      nameController: nameController,
                      passwordOneController: passwordOneController,
                      passwordTwoController: passwordTwoController,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        final String email = emailController.text;
                        final String passwordOne = passwordOneController.text;
                        final String passwordTwo = passwordTwoController.text;
                        final String name = nameController.text;
                        BlocProvider.of<RegistrationBloc>(context)
                            .add(TryRegistration(
                          name: name,
                          context: context,
                          email: email,
                          passwordOne: passwordOne,
                          passwordTwo: passwordTwo,
                        ));
                      },
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(244, 244, 244, 1),
                        ),
                        child: const Center(
                            child: Text('Зарегистрироваться',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Уже есть аккаунт?',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('auth');
                          },
                          child: const Text(
                            'Войти',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
