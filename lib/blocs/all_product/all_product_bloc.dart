import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
        final productsFeat = await _client.getProductFeatured();
        final productsSale = await _client.getProductOnSale();

        emit(AllProductLoaded(
            productOnSale: productsSale, productFeatured: productsFeat));
      } catch (e) {
        emit(AllProductError(errorMassage: 'Что то пошло не так'));
      }
    });
  }
}
