import 'dart:convert';

OrderProduct orderProductFromJson(String str) =>
    OrderProduct.fromJson(json.decode(str));

String orderProductToJson(OrderProduct data) => json.encode(data.toJson());

class OrderProduct {
  OrderProduct({
    required this.productId,
    required this.quantity,
  });

  int productId;
  int quantity;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
