import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/app_images.dart';
import '../blocs/auth/auth_bloc.dart';

class AuthWigget extends StatelessWidget {
  const AuthWigget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AuthBloc(),
        child: const AuthScreenWidget(),
      );
}

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final paswordController = TextEditingController();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthTrue) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bacgrountAuth),
                    fit: BoxFit.cover),
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
                            width: 250, image: AssetImage(AppImages.logo)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const TitleAuthPage(
                        title: 'Войти',
                      ),
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
                            decoration: const InputDecoration(
                              hintText: 'Логин',
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                            ),
                            controller: loginController,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade200),
                        child: Center(
                          child: TextField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Пароль',
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.black,
                              ),
                            ),
                            controller: paswordController,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Зарегистрироваться',
                              style: TextStyle(color: Colors.red)))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (state is AuthError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Container();
      },
    );
  }
}

class TitleAuthPage extends StatelessWidget {
  final String title;
  const TitleAuthPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
