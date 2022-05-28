import 'package:equatable/equatable.dart';
import 'package:testfff/modal/product_modal.dart';

class ProductCard extends Equatable {
  List<Product> productsCard = [];
  String get total => productsCard.fold(
      0.toString(), (total, current) => total + current.salePrice);
  ProductCard({required this.productsCard});

  @override
  List<Object?> get props => [productsCard];
}
