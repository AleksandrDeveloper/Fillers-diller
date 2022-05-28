part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthTrue extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  String errorMassege;
  AuthError({required this.errorMassege});

  @override
  List<Object> get props => [errorMassege];
}
