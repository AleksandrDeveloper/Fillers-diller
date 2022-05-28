import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testfff/api_client/api_client.dart';
import 'package:flutter/material.dart';
import '../../modal/product_modal.dart';

part 'category_product_event.dart';
part 'category_product_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final client = ApiClient();
  CategoryProductBloc() : super(CategoryProductLoading()) {
    on<GetCategory>((event, emit) async {
      emit(CategoryProductLoading());
      try {
        final categoryProductJson =
            await client.getProductCategory(categoryId: event.categoryId);
        print(' это длина списка ${categoryProductJson.length}');
        Navigator.of(event.context).pushNamed('home_screen/category_screen');

        emit(CategoryProductLoaded(categoryProduct: categoryProductJson));
      } catch (e) {
        emit(CategoryProductError(errorMassage: 'Какая то ошибка'));
      }
    });
  }
}
