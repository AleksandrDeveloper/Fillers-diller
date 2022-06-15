import 'package:equatable/equatable.dart';
import 'package:testfff/modal/product_modal.dart';

class TestModalProduct extends Equatable {
  List<Product> productCard = [];

  // int get prise => int.parse(productCard[index].regularPrice);

  int get quantity {
    return productCard.fold(1, (previousValue, element) => previousValue += 1);
  }

  @override
  List<Object?> get props => [];
}
