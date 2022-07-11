import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../modal/product_card.dart';
import '../../modal/product_modal.dart';
part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc() : super(ProductCardLoading()) {
    List<Product> listProducts = [];

    int tottalPrises = 0;

    on<AddProductToCard>(
      (event, emit) {
        emit(ProductCardLoading());
        try {
          listProducts.add(event.product);
          int prise = int.parse(event.product.regularPrice);
          tottalPrises = tottalPrises += prise;
          emit(ProductCardLoaded(
            productCard: ProductCard(products: listProducts),
            newQuntity: tottalPrises,
          ));
        } catch (e) {
          emit(const ProductCardError(errorMessage: 'Что то не так'));
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

    on<PudQuntity>((event, emit) {
      try {
        var product = event.product;
        // listProducts.add(event.product);
        int newQuntity = product.quntity += 1;
        int prise = int.parse(event.product.regularPrice);

        tottalPrises = tottalPrises += prise;

        emit(ProductCardLoaded(
            productCard: ProductCard(products: listProducts),
            newQuntity: tottalPrises));
      } catch (e) {}
    });

    on<RemuveQuntity>((event, emit) {
      try {
        var product = event.product;

        int newQuntity = product.quntity -= 1;
        int prise = int.parse(event.product.regularPrice);

        tottalPrises = tottalPrises -= prise;
        emit(ProductCardLoaded(
            productCard: ProductCard(products: listProducts),
            newQuntity: tottalPrises));
      } catch (e) {}
    });
  }
}
