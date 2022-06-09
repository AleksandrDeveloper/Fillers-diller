import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../modal/card_product.dart';
import '../../modal/product_modal.dart';
part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc() : super(ProductCardLoading()) {
    on<AddProductToCard>(
      (event, emit) {
        emit(ProductCardLoading());
        try {
          CardProduct cardProduct;
          List<CardProduct> productCard = [];

          cardProduct = CardProduct(
              productId: event.product.id,
              quantity: 1,
              name: event.product.name,
              price: event.product.salePrice,
              regularPrice: event.product.regularPrice);
          print(productCard.length);
          productCard.add(cardProduct);

          // productCard.add(CardProduct(
          //     productId: event.product.id,
          //     quantity: 1,
          //     name: event.product.name,
          //     price: event.product.salePrice,
          //     regularPrice: event.product.regularPrice));
          // productCardTwo.addAll(productCard);
          emit(ProductCardLoaded(productCardBloc: productCard));
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
