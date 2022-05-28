import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testfff/api_client/api_client.dart';

import '../../storage/id_user_preferences.dart';
import '../../storage/is_autf_pref.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final client = ApiClient();
  final prefUserId = UserIdPrefProvider();
  final prefIsAuth = IsAuthPrefProvider();
  bool isAuth = false;
  AuthBloc() : super(AuthTrue()) {
    on<TryAuth>((event, emit) async {
      try {
        final login = event.login;
        final pasword = event.pasword;
        final context = event.context;

        if (login.isEmpty || pasword.isEmpty) {
          isAuth = false;
          print('логин или пароль пустой');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Заполните логин или пароль'),
            ),
          );
          return;
        }

        if (login.isNotEmpty || pasword.isNotEmpty) {
          print('login = $login, password = $pasword');
          final userEmail = await client.authUser(
            userName: login,
            userPasword: pasword,
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Вы авторизовались успешно'),
          ));

          isAuth = true;

          if (isAuth = true) {
            final userId = await client.authId(userEmail: userEmail);

            var box = await Hive.openBox<bool>('isAuth');
            await box.delete('isAuthKey');
            await box.put('isAuthKey', true);

            box.close();
            print('это user id из bloc $userId');
            Navigator.of(context).pushReplacementNamed('home_screen');
          }

          return;
        }

        emit(AuthTrue());
      } catch (e) {
        emit(AuthError(errorMassege: 'Произошла ошибка'));
      }
    });
  }
}