part of 'category_product_bloc.dart';

abstract class CategoryProductEvent extends Equatable {
  const CategoryProductEvent();

  @override
  List<Object> get props => [];
}

class GetCategory extends CategoryProductEvent {
  final int categoryId;
  final BuildContext context;
  const GetCategory({required this.categoryId, required this.context});
  @override
  List<Object> get props => [categoryId, context];
}
