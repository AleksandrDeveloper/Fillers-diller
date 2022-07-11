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
  final List<Product> productFeatured;
  final List<Product> productOnSale;

  const AllProductLoaded({
    required this.productFeatured,
    required this.productOnSale,
  });

  @override
  List<Object> get props => [
        productFeatured,
        productOnSale,
      ];
}

class AllProductError extends AllProductState {
  final String errorMassage;
  const AllProductError({required this.errorMassage});

  @override
  List<Object> get props => [errorMassage];
}
