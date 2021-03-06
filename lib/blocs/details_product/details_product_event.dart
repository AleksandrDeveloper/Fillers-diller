part of 'details_product_bloc.dart';

abstract class DetailsProductEvent extends Equatable {
  const DetailsProductEvent();

  @override
  List<Object> get props => [];
}

class GetDetailProduct extends DetailsProductEvent {
  final int productId;
  final BuildContext context;
  const GetDetailProduct({required this.productId, required this.context});

  @override
  List<Object> get props => [productId, context];
}
