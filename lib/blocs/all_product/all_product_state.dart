part of 'all_product_bloc.dart';

abstract class AllProductState extends Equatable {
  const AllProductState();

  @override
  List<Object> get props => [];
}

class AllProductLoading extends AllProductState {
  @override
  List<Object> get props => [];
}

class AllProductLoaded extends AllProductState {
  List<Product> productFeatured = [];
  List<Product> productOnSale = [];

  AllProductLoaded(
      {required this.productFeatured, required this.productOnSale});

  @override
  List<Object> get props => [productFeatured, productOnSale];
}

class AllProductError extends AllProductState {
  String errorMassage;
  AllProductError({required this.errorMassage});

  @override
  List<Object> get props => [errorMassage];
}
