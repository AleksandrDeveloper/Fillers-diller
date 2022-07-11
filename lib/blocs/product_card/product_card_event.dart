part of 'product_card_bloc.dart';

abstract class ProductCardEvent extends Equatable {
  const ProductCardEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCard extends ProductCardEvent {
  final Product product;
  const AddProductToCard({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class DeleteProductToCard extends ProductCardEvent {
  final Product product;
  const DeleteProductToCard({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class PudQuntity extends ProductCardEvent {
  final Product product;
  const PudQuntity({required this.product});
  @override
  List<Object> get props => [product];
}

class RemuveQuntity extends ProductCardEvent {
  final Product product;
  const RemuveQuntity({required this.product});
  @override
  List<Object> get props => [product];
}
