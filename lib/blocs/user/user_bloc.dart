import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:testfff/config/api_client.dart';

import '../../modal/user_modal.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _client = ApiClient();
  UserBloc() : super(UserLoading()) {
    on<AddUser>((event, emit) async {
      emit(UserLoading());
      try {
        Navigator.of(event.context).pushNamed('home_screen/user_screen');
        final userIdBox = await Hive.openBox<int>('userIdBox');
        final userId = userIdBox.get('userIdKey') as int;
        await userIdBox.close();

        final jsonUser = await _client.searchUser(userId: userId);
        Navigator.of(event.context).pushNamed('home_screen/user_screen');
        emit(UserLoaded(user: jsonUser));
      } catch (e) {
        emit(const UserError(errorMessag: 'Что то пошло не так'));
      }
    });
  }
}
