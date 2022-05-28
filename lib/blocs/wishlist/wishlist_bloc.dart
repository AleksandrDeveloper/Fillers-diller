import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../modal/product_card_order.dart';
import '../../modal/product_modal.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    List<Product> productWorc = [];
    List<ProductCardOrder> productCard = [];
    on<AddProductWishlist>((event, emit) async {
      emit(WishlistLoading());
      try {
        productWorc.add(event.product);

        productCard
            .add(ProductCardOrder(productId: event.product.id, quantity: 10));

        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
          content: Text('Товар добавлена в избранное'),
        ));
        emit(WishlistLoaded(wishlistProduct: productWorc));
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
        emit(WishlistLoaded(wishlistProduct: productWorc));
      } catch (e) {
        emit(WishlistError(errorMassage: 'Что то пошло не так'));
      }
    });
  }
}
