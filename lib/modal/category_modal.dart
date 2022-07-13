class CategoryProduct {
  final int id;
  final String name;
  final String slug;
  final int parent;
  final String description;
  final String display;
  final dynamic image;
  final int menuOrder;
  final int count;

  CategoryProduct({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent,
    required this.description,
    required this.display,
    required this.image,
    required this.menuOrder,
    required this.count,
  });

  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      CategoryProduct(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parent: json["parent"],
        description: json["description"],
        display: json["display"],
        image: json["image"],
        menuOrder: json["menu_order"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent": parent,
        "description": description,
        "display": display,
        "image": image,
        "menu_order": menuOrder,
        "count": count,
      };
}
