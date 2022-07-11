import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import '../../screens/auth_screen.dart';
import '../../screens/home_screen.dart';
part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenLoading()) {
    on<OpenApp>((event, emit) async {
      emit(SplashscreenLoading());
      try {
        var box = await Hive.openBox<bool>('isAuth');
        var isAuth = box.get('isAuthKey', defaultValue: false) as bool;
        final Widget widget =
            isAuth == false ? const AuthWigget() : const HomeScreen();
        box.close();
        emit(SplashscreenLoaded(widget: widget));
      } catch (e) {}
    });
  }
}
