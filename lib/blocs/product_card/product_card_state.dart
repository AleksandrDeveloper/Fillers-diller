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
  List<CardProduct> productCardBloc;

  ProductCardLoaded({required this.productCardBloc});
  @override
  List<Object> get props => [productCardBloc];
}

class ProductCardError extends ProductCardState {
  String errorMessage;
  ProductCardError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
