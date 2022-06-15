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
  final ProductCard productCard;

  const ProductCardLoaded({required this.productCard});
  @override
  List<Object> get props => [productCard];
}

class ProductCardError extends ProductCardState {
  String errorMessage;
  ProductCardError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
