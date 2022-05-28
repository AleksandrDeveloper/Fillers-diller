part of 'product_card_bloc.dart';

abstract class ProductCardEvent extends Equatable {
  const ProductCardEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCard extends ProductCardEvent {
  final Product product;
  AddProductToCard({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteProductToCard extends ProductCardEvent {
  final Product product;
  DeleteProductToCard({required this.product});

  @override
  List<Object> get props => [product];
}
