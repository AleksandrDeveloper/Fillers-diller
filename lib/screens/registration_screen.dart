import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/registration/registration_bloc.dart';
import '../config/app_images.dart';

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
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        if (state is RegistrationError) {
                          return Text(
                            state.errorName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                  color: const Color.fromARGB(255, 212, 12, 12),
                                ),
                          );
                        }
                        return Container();
                      },
                    ),
                    Container(
                      height: 50,
                      width: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Ваше имя',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          controller: emailController,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        if (state is RegistrationError) {
                          return Text(
                            state.errorEmail,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                  color: const Color.fromARGB(255, 212, 12, 12),
                                ),
                          );
                        }
                        return Container();
                      },
                    ),
                    Container(
                      height: 50,
                      width: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.black,
                            ),
                          ),
                          controller: emailController,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        if (state is RegistrationError) {
                          return Text(
                            state.errorPasswordOne,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                  color: const Color.fromARGB(255, 212, 12, 12),
                                ),
                          );
                        }
                        return Container();
                      },
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
                          controller: passwordOneController,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        if (state is RegistrationError) {
                          return Text(
                            state.errorPasswordTwo,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                  color: const Color.fromARGB(255, 212, 12, 12),
                                ),
                          );
                        }
                        return Container();
                      },
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
                            hintText: 'Повторите пароль',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.black,
                            ),
                          ),
                          controller: passwordTwoController,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
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
