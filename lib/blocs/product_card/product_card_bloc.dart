import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../modal/product_card.dart';
import '../../modal/product_modal.dart';
part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc() : super(ProductCardLoading()) {
    List<Product> listProducts = [];

    on<AddProductToCard>(
      (event, emit) {
        emit(ProductCardLoading());
        try {
          listProducts.add(event.product);
          int tottalPrises = listProducts.fold(
              0,
              (previousValue, element) =>
                  previousValue + element.regularPriceInt);

          print(listProducts.length);
          emit(ProductCardLoaded(
            productCard: ProductCard(products: listProducts),
          ));
        } catch (e) {
          emit(ProductCardError(errorMessage: 'Что то не так'));
        }
      },
    );
    // on<DeleteProductToCard>(
    //   (event, emit) {
    //     emit(ProductCardLoading());
    //     try {
    //       List<Product> productTest = [];
    //       productTest.remove(event.product);
    //       String total = productTest.fold(
    //           0.toString(), (total, current) => total + current.salePrice);
    //       emit(
    //           ProductCardLoaded(productCardBloc: productTest, subtotal: total));
    //     } catch (e) {
    //       emit(ProductCardError(errorMessage: 'Что то не так'));
    //     }
    //   },
    // );
  }
}
