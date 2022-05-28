part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class AddProductWishlist extends WishlistEvent {
  final BuildContext context;
  final Product product;
  const AddProductWishlist({required this.product, required this.context});
  @override
  List<Object> get props => [product, context];
}

class RemoveProductWishlist extends WishlistEvent {
  final Product product;
  final BuildContext context;
  const RemoveProductWishlist({required this.product, required this.context});
  @override
  List<Object> get props => [product, context];
}
