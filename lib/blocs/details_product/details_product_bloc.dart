import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:testfff/config/api_client.dart';

import '../../modal/product_modal.dart';

part 'details_product_event.dart';
part 'details_product_state.dart';

class DetailsProductBloc
    extends Bloc<DetailsProductEvent, DetailsProductState> {
  final client = ApiClient();
  DetailsProductBloc() : super(DetailsProductLoading()) {
    on<GetDetailProduct>((event, emit) async {
      emit(DetailsProductLoading());
      try {
        var detailsProduct =
            await client.getDeteilsProduct(productId: event.productId);

        Navigator.of(event.context).pushNamed('home_screen/product_screen');
        emit(DetailsProductLoaded(detailsProducts: detailsProduct));
      } catch (e) {
        emit(DetailsProductError(errrorMasage: 'Какая то ошибка'));
      }
    });
  }
}
