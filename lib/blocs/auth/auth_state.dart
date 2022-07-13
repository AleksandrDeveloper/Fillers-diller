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
  final String errorEmail;
  final String errorPassword;
  const AuthError({
    required this.errorEmail,
    required this.errorPassword,
  });

  @override
  List<Object> get props => [
        errorEmail,
        errorPassword,
      ];
}
