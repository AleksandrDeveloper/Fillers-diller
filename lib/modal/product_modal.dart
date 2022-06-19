import 'package:equatable/equatable.dart';
import 'category_modal.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class Product extends Equatable {
  int id;
  String name;
  bool featured;
  bool onSale;
  String shortDescription;
  String description;
  String regularPrice;
  int quntity;
  String salePrice;
  List<CategoryProduct> category;
  List<ImagesProduct> images;

  Product(
    this.category,
    this.onSale,
    this.description,
    this.featured,
    this.quntity,
    this.id,
    this.images,
    this.name,
    this.regularPrice,
    this.salePrice,
    this.shortDescription,
  );

  String get descriptionHtml => parse(shortDescription).body!.text;

  int get regularPriceInt => int.parse(regularPrice);

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        quntity = 1,
        onSale = json['on_sale'],
        name = json['name'],
        featured = json['featured'],
        shortDescription = json['short_description'],
        description = json['description'],
        regularPrice = json['regular_price'],
        salePrice = json['sale_price'],
        images = (json['images'] as List<dynamic>)
            .map((json) => ImagesProduct.fromJson(json))
            .toList(),
        category = (json['categories'] as List<dynamic>)
            .map((json) => CategoryProduct.fromJson(json))
            .toList();

  @override
  List<Object?> get props => [
        category,
        onSale,
        description,
        featured,
        id,
        images,
        name,
        regularPrice,
        salePrice,
        shortDescription,
      ];
}

class ImagesProduct extends Equatable {
  int id;
  String src;

  ImagesProduct(
    this.id,
    this.src,
  );

  ImagesProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        src = json['src'];

  @override
  List<Object?> get props => [
        id,
        src,
      ];
}
