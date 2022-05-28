import 'package:equatable/equatable.dart';

class CategoryProduct extends Equatable {
  int id;
  String name;

  CategoryProduct(
    this.id,
    this.name,
  );

  CategoryProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  @override
  List<Object?> get props => [id, name];
}
