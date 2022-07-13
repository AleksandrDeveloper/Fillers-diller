part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class TryRegistration extends RegistrationEvent {
  final BuildContext context;
  final String email;
  final String passwordOne;
  final String passwordTwo;
  final String name;
  const TryRegistration({
    required this.context,
    required this.email,
    required this.name,
    required this.passwordOne,
    required this.passwordTwo,
  });

  @override
  List<Object> get props => [
        context,
        email,
        passwordOne,
        passwordTwo,
        name,
      ];
}
