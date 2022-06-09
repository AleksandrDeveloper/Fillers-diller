import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api_client/api_client.dart';

import '../../modal/product_modal.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  AllProductBloc() : super(AllProductLoading()) {
    final client = ApiClient();

    List<Product> products;
    on<AllProductEvent>((event, emit) async {
      emit(AllProductLoading());
      try {
        final productsFeat = await client.getProductFeatured();
        final productsSale = await client.getProductOnSale();

        emit(AllProductLoaded(
            productOnSale: productsSale, productFeatured: productsFeat));
      } catch (e) {
        emit(AllProductError(errorMassage: 'Что то пошло не так'));
      }
    });
  }
}
