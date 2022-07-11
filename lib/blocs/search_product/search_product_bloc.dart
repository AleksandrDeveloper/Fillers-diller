import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testfff/config/api_client.dart';
import '../../modal/product_modal.dart';
part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  SearchProductBloc() : super(SearchProductLoading()) {
    final client = ApiClient();
    on<GetProduct>((event, emit) async {
      emit(SearchProductLoading());
      try {
        var productJson = await client.getProductSearch(
            searchString: event.searchProductString);
        Navigator.of(event.context).pushNamed('home_screen/search_product');
        emit(SearchProductLoaded(searchProduct: productJson));
      } catch (e) {
        emit(SearchProductError(title: 'Какая то ошибка'));
      }
    });
  }
}
