part of 'search_product_bloc.dart';

abstract class SearchProductState extends Equatable {
  const SearchProductState();

  @override
  List<Object> get props => [];
}

class SearchProductLoading extends SearchProductState {
  @override
  List<Object> get props => [];
}

class SearchProductLoaded extends SearchProductState {
  List<Product> searchProduct = [];
  SearchProductLoaded({
    required this.searchProduct,
  });

  @override
  List<Object> get props => [searchProduct];
}

class SearchProductError extends SearchProductState {
  String title;
  SearchProductError({required this.title});

  @override
  List<Object> get props => [title];
}
