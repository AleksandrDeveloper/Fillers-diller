import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../modal/product_modal.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    List<Product> productWorc = [];

    on<AddProductWishlist>((event, emit) async {
      emit(WishlistLoading());
      try {
        productWorc.add(event.product);
        int totalPrise = productWorc.fold(
            0,
            (previousValue, element) =>
                previousValue + element.regularPriceInt);
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
          content: Text('Товар добавлена в избранное'),
        ));
        emit(WishlistLoaded(
            wishlistProduct: productWorc, totalPrise: totalPrise));
      } catch (e) {
        emit(WishlistError(errorMassage: 'Что то пошло не так'));
      }
    });
    on<RemoveProductWishlist>((event, emit) {
      emit(WishlistLoading());
      try {
        var productEvent = event.product;
        productWorc.remove(productEvent);
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
          content: Text('Товар удален из избранного'),
        ));
        emit(WishlistLoaded(wishlistProduct: productWorc, totalPrise: 0));
      } catch (e) {
        emit(WishlistError(errorMassage: 'Что то пошло не так'));
      }
    });
  }
}
