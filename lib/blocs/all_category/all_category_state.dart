part of 'all_category_bloc.dart';

abstract class AllCategoryState extends Equatable {
  const AllCategoryState();

  @override
  List<Object> get props => [];
}

class AllCategoryLoading extends AllCategoryState {
  @override
  List<Object> get props => [];
}

class AllCategoryLoaded extends AllCategoryState {
  final List<CategoryProduct> category;

  const AllCategoryLoaded({required this.category});

  @override
  List<Object> get props => [category];
}

class AllCategoryError extends AllCategoryState {
  final String errorMassage;
  const AllCategoryError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
