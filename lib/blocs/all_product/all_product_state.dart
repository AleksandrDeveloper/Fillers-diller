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
  final List<Product> products;

  const AllProductLoaded({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];
}

class AllProductError extends AllProductState {
  final String errorMassage;
  const AllProductError({required this.errorMassage});

  @override
  List<Object> get props => [errorMassage];
}
