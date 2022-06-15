import 'package:equatable/equatable.dart';

import 'product_modal.dart';

class ProductCard extends Equatable {
  const ProductCard({required this.products}); //= const <Product>[]//
  final List<Product> products;

  int get totalPrise => products.fold(
      0, (previousValue, element) => previousValue += element.regularPriceInt);

  int get quntity =>
      products.fold(1, (previousValue, element) => previousValue += 1);

  @override
  List<Object?> get props => [products];
}
