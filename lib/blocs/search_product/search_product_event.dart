part of 'search_product_bloc.dart';

abstract class SearchProductEvent extends Equatable {
  const SearchProductEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends SearchProductEvent {
  String searchProductString;
  BuildContext context;
  GetProduct({required this.searchProductString, required this.context});

  @override
  List<Object> get props => [searchProductString, context];
}
