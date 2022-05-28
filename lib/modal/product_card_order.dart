import 'package:equatable/equatable.dart';

class ProductCardOrder extends Equatable {
  final int productId;
  final int quantity;

  ProductCardOrder({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'quantity': quantity,
      };

  @override
  List<Object?> get props => [productId, quantity];
}
