part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationError extends RegistrationState {
  final String errorEmail;
  final String errorPasswordOne;
  final String errorPasswordTwo;
  const RegistrationError({
    required this.errorEmail,
    required this.errorPasswordOne,
    required this.errorPasswordTwo,
  });
  @override
  List<Object> get props => [
        errorEmail,
        errorPasswordOne,
        errorPasswordTwo,
      ];
}
