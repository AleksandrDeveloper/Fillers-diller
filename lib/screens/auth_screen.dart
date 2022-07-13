import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/app_images.dart';
import '../blocs/auth/auth_bloc.dart';
import '../widgets/widgets.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final paswordController = TextEditingController();

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    'Вход',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                TextFieldAuthWidget(
                  controller: loginController,
                  hintText: 'Логин',
                  obscureText: false,
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                ),
                TextFieldAuthWidget(
                  controller: paswordController,
                  hintText: 'Пароль',
                  obscureText: true,
                  icon: const Icon(
                    Icons.key,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    final String login = loginController.text;
                    final String pasword = paswordController.text;
                    BlocProvider.of<AuthBloc>(context).add(
                      TryAuth(
                        login: login,
                        pasword: pasword,
                        context: context,
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(244, 244, 244, 1),
                    ),
                    child: const Center(
                        child: Text('Войти',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Еще нет аккаунта?',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('auth/registration');
                      },
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
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
