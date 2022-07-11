part of 'details_product_bloc.dart';

abstract class DetailsProductState extends Equatable {
  const DetailsProductState();

  @override
  List<Object> get props => [];
}

class DetailsProductLoading extends DetailsProductState {
  @override
  List<Object> get props => [];
}

class DetailsProductLoaded extends DetailsProductState {
  final Product detailsProducts;
  const DetailsProductLoaded({required this.detailsProducts});

  @override
  List<Object> get props => [detailsProducts];
}

class DetailsProductError extends DetailsProductState {
  final String errrorMasage;
  const DetailsProductError({required this.errrorMasage});
  @override
  List<Object> get props => [errrorMasage];
}
