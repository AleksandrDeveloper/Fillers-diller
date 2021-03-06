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
  final String errorName;
  const RegistrationError({
    required this.errorEmail,
    required this.errorPasswordOne,
    required this.errorPasswordTwo,
    required this.errorName,
  });
  @override
  List<Object> get props => [
        errorEmail,
        errorPasswordOne,
        errorPasswordTwo,
        errorName,
      ];
}
