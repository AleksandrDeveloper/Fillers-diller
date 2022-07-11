part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class TryAuth extends AuthEvent {
  final BuildContext context;
  final String login;
  final String pasword;

  const TryAuth({
    required this.login,
    required this.pasword,
    required this.context,
  });

  @override
  List<Object> get props => [login, pasword, context];
}
