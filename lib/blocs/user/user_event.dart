part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  final BuildContext context;
  const AddUser({required this.context});

  @override
  List<Object> get props => [context];
}
