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
  List<CategoryProduct> category = [];

  AllCategoryLoaded({required this.category});

  @override
  List<Object> get props => [category];
}

class AllCategoryError extends AllCategoryState {
  String errorMassage;
  AllCategoryError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
