import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testfff/config/api_client.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final _client = ApiClient();
  RegistrationBloc() : super(RegistrationInitial()) {
    bool isRegistration = false;
    on<TryRegistration>(
      (event, emit) async {
        final email = event.email;
        final name = event.name;
        final passwordOne = event.passwordOne;
        final passwordTwo = event.passwordTwo;

        //name validation
        if (name.isEmpty) {
          isRegistration = false;
          emit(const RegistrationError(
            errorEmail: '',
            errorPasswordOne: '',
            errorPasswordTwo: '',
            errorName: 'Поле пустое, введите свое имя',
          ));
          return;
        } else {
          isRegistration = true;
        }

        //email validation
        if (email.isEmpty) {
          isRegistration = false;
          emit(const RegistrationError(
            errorEmail: 'Поле пустое, введите свой Email',
            errorPasswordOne: '',
            errorPasswordTwo: '',
            errorName: '',
          ));
          return;
        }
        if (email.isNotEmpty &&
            RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]").hasMatch(email)) {
          isRegistration = true;
        } else {
          isRegistration = false;
          emit(const RegistrationError(
            errorEmail: 'Email введен не корректно',
            errorPasswordOne: '',
            errorPasswordTwo: '',
            errorName: '',
          ));
          return;
        }

        //passwordOne validation
        if (passwordOne.isEmpty) {
          isRegistration = false;
          emit(const RegistrationError(
            errorEmail: '',
            errorPasswordOne: 'Поле пустое, введите пароль',
            errorPasswordTwo: '',
            errorName: '',
          ));
          return;
        }
        if (passwordOne.isNotEmpty &&
            RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$").hasMatch(passwordOne)) {
          isRegistration = true;
        } else {
          isRegistration = false;
          emit(const RegistrationError(
            errorEmail: '',
            errorPasswordOne:
                'Пароль должен быть не короче 8 символов и содержит латиницу с цифрами',
            errorPasswordTwo: '',
            errorName: '',
          ));
          return;
        }

        //passwordTwo validation
        if (passwordTwo.isEmpty) {
          isRegistration = false;
          emit(const RegistrationError(
            errorEmail: '',
            errorPasswordOne: '',
            errorPasswordTwo: 'Поле пустое, введите пароль',
            errorName: '',
          ));
          return;
        }
        if (passwordOne != passwordTwo) {
          isRegistration = false;
          emit(const RegistrationError(
            errorEmail: '',
            errorPasswordOne: '',
            errorPasswordTwo: 'Пароль не совпадает',
            errorName: '',
          ));
          return;
        } else {
          isRegistration = true;
        }

        //registration
        if (isRegistration = true) {
          final response = await _client.createCustomer(
            email: email,
            password: passwordOne,
            name: name,
          );
          print('это результат запроса регистрации $response');
          if (response == true) {
            try {
              final userId = await _client.authId(userEmail: email);
              var userIdBox = await Hive.openBox<int>('userIdBox');
              await userIdBox.put('userIdKey', userId);
              final userIdMain = userIdBox.get('userIdKey') as int;

              await userIdBox.close();

              var box = await Hive.openBox<bool>('isAuth');
              await box.delete('isAuthKey');
              await box.put('isAuthKey', true);

              box.close();
              ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
                content: Text('Регистрация прошла успешно'),
              ));
              Navigator.of(event.context).pushReplacementNamed('home_screen');
            } catch (e) {
              ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
                content: Text('Регистрация не удалась'),
              ));
            }
          }
        }
      },
    );
  }
}
