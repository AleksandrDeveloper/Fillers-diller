class OrderProduct {
  OrderProduct({
    required this.productId,
    required this.quantity,
  });

  final int productId;
  final int quantity;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
