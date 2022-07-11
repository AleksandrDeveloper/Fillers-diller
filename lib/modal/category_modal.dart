import 'package:equatable/equatable.dart';

class CategoryProduct extends Equatable {
  final int id;
  final String name;

  CategoryProduct({
    required this.id,
    required this.name,
  });

  CategoryProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  @override
  List<Object?> get props => [id, name];
}
