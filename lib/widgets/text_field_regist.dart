import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/registration/registration_bloc.dart';

class TextFieldRegistWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final String errorText;
  const TextFieldRegistWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if (state is RegistrationError) {
              var errortText = errorText == 'email'
                  ? state.errorEmail
                  : errorText == 'name'
                      ? state.errorName
                      : errorText == 'passwordOne'
                          ? state.errorPasswordOne
                          : state.errorPasswordTwo;
              return Text(
                errortText,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                prefixIcon: icon,
              ),
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}
