part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderLoading extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderGood extends OrderState {
  final bool createOrder;
  const OrderGood({required this.createOrder});
  @override
  List<Object> get props => [createOrder];
}
