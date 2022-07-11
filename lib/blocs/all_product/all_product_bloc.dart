import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../config/api_client.dart';

import '../../modal/product_modal.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final _client = ApiClient();
  AllProductBloc() : super(AllProductLoading()) {
    on<AllProductEvent>((event, emit) async {
      emit(AllProductLoading());
      try {
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          final productsFeat = await _client.getProduct();
          emit(AllProductLoaded(products: productsFeat));
        } else {
          final boxProduct = await Hive.openBox<String>('boxProduct');
          final cashProduct = boxProduct.get('jsonProduct');
          await boxProduct.close();
          final reqestJson = jsonDecode(cashProduct!) as List;
          List<Product> productJson =
              reqestJson.map((json) => Product.fromJson(json)).toList();
          emit(AllProductLoaded(products: productJson));
        }
      } catch (e) {
        emit(const AllProductError(errorMassage: 'Что то пошло не так'));
      }
    });
  }
}
