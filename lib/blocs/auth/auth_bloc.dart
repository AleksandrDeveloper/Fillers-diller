import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testfff/config/api_client.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _client = ApiClient();

  bool isAuth = false;
  AuthBloc() : super(AuthTrue()) {
    on<TryAuth>((event, emit) async {
      try {
        final login = event.login;
        final pasword = event.pasword;
        final context = event.context;

        if (login.isEmpty || pasword.isEmpty) {
          isAuth = false;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Заполните логин или пароль'),
            ),
          );
          return;
        }

        if (login.isNotEmpty || pasword.isNotEmpty) {
          final userEmail = await _client.authUser(
            userName: login,
            userPasword: pasword,
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Вы авторизовались успешно'),
          ));

          isAuth = true;

          if (isAuth = true) {
            final userId = await _client.authId(userEmail: userEmail);
            var userIdBox = await Hive.openBox<int>('userIdBox');
            await userIdBox.put('userIdKey', userId);
            final userIdMain = userIdBox.get('userIdKey') as int;

            await userIdBox.close();

            var box = await Hive.openBox<bool>('isAuth');
            await box.delete('isAuthKey');
            await box.put('isAuthKey', true);

            box.close();

            Navigator.of(context).pushReplacementNamed('home_screen');
          }

          return;
        }

        emit(AuthTrue());
      } catch (e) {}
    });
  }
}
