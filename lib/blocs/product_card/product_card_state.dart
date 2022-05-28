part of 'product_card_bloc.dart';

abstract class ProductCardState extends Equatable {
  const ProductCardState();

  @override
  List<Object> get props => [];
}

class ProductCardLoading extends ProductCardState {
  @override
  List<Object> get props => [];
}

class ProductCardLoaded extends ProductCardState {
  List<Product> productCardBloc;
  String subtotal;
  ProductCardLoaded({required this.productCardBloc, required this.subtotal});
  @override
  List<Object> get props => [productCardBloc, subtotal];
}

class ProductCardError extends ProductCardState {
  String errorMessage;
  ProductCardError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
