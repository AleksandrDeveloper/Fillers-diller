part of 'splashscreen_bloc.dart';

abstract class SplashscreenState extends Equatable {
  const SplashscreenState();

  @override
  List<Object> get props => [];
}

class SplashscreenLoading extends SplashscreenState {
  @override
  List<Object> get props => [];
}

class SplashscreenLoaded extends SplashscreenState {
  Widget widget;

  SplashscreenLoaded({required this.widget});

  @override
  List<Object> get props => [widget];
}
