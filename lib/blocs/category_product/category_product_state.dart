part of 'category_product_bloc.dart';

abstract class CategoryProductState extends Equatable {
  const CategoryProductState();

  @override
  List<Object> get props => [];
}

class CategoryProductLoading extends CategoryProductState {
  @override
  List<Object> get props => [];
}

class CategoryProductLoaded extends CategoryProductState {
  List<Product> categoryProduct = [];
  CategoryProductLoaded({required this.categoryProduct});
  @override
  List<Object> get props => [categoryProduct];
}

class CategoryProductError extends CategoryProductState {
  String errorMassage;
  CategoryProductError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
