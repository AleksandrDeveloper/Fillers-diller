part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  List<Product> wishlistProduct = [];
  WishlistLoaded({required this.wishlistProduct});
  @override
  List<Object> get props => [wishlistProduct];
}

class WishlistError extends WishlistState {
  String errorMassage;
  WishlistError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
