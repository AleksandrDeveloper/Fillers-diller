part of 'splashscreen_bloc.dart';

abstract class SplashscreenEvent extends Equatable {
  const SplashscreenEvent();

  @override
  List<Object> get props => [];
}

class OpenApp extends SplashscreenEvent {
  BuildContext context;
  OpenApp({required this.context});

  @override
  List<Object> get props => [context];
}
