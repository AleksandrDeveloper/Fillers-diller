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
  final Widget widget;
  final String imageUrl;

  const SplashscreenLoaded({
    required this.widget,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
        widget,
        imageUrl,
      ];
}
