import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../screens/auth_screen.dart';
import '../../screens/home_screen.dart';
part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenLoading()) {
    String? umageUrl;
    on<OpenApp>((event, emit) async {
      emit(SplashscreenLoading());
      try {
        var box = await Hive.openBox<bool>('isAuth');
        var isAuth = box.get('isAuthKey', defaultValue: false) as bool;
        final Widget widget =
            isAuth == false ? const AuthScreenWidget() : const HomeScreen();
        box.close();
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          umageUrl =
              'https://fillers-diller.ru/wp-content/uploads/2021/05/1620743215730-2.png';
        } else {
          umageUrl = '';
        }
        emit(SplashscreenLoaded(widget: widget, imageUrl: umageUrl!));
      } catch (e) {}
    });
  }
}
