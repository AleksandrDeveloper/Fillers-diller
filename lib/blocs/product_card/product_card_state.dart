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
  final int newQuntity;

  ProductCardLoaded({
    required this.productCard,
    required this.newQuntity,
  });
  @override
  List<Object> get props => [productCard, newQuntity];
}

class ProductCardError extends ProductCardState {
  String errorMessage;
  ProductCardError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
