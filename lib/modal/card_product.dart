import 'dart:convert';

CardProduct cardProductFromJson(String str) =>
    CardProduct.fromJson(json.decode(str));

String cardProductToJson(CardProduct data) => json.encode(data.toJson());

class CardProduct {
  CardProduct({
    required this.productId,
    required this.quantity,
    required this.name,
    required this.price,
    required this.regularPrice,
  });

  int productId;
  int quantity;
  String name;
  String price;
  String regularPrice;

  factory CardProduct.fromJson(Map<String, dynamic> json) => CardProduct(
        productId: json["product_id"],
        quantity: json["quantity"],
        name: json["name"],
        price: json["price"],
        regularPrice: json["regular_price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "name": name,
        "price": price,
        "regular_price": regularPrice,
      };
}
