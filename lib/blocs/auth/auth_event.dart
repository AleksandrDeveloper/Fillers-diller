part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class TryAuth extends AuthEvent {
  BuildContext context;
  String login;
  String pasword;

  TryAuth({
    required this.login,
    required this.pasword,
    required this.context,
  });

  @override
  List<Object> get props => [login, pasword, context];
}
