class User {
  final int id;
  final DateTime dateCreated;
  final DateTime dateCreatedGmt;
  final DateTime dateModified;
  final DateTime dateModifiedGmt;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String username;
  final Ing billing;
  final Ing shipping;
  final bool isPayingCustomer;
  final String avatarUrl;
  final Links links;

  const User({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.username,
    required this.billing,
    required this.shipping,
    required this.isPayingCustomer,
    required this.avatarUrl,
    required this.links,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        username: json["username"],
        billing: Ing.fromJson(json["billing"]),
        shipping: Ing.fromJson(json["shipping"]),
        isPayingCustomer: json["is_paying_customer"],
        avatarUrl: json["avatar_url"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "username": username,
        "billing": billing.toJson(),
        "shipping": shipping.toJson(),
        "is_paying_customer": isPayingCustomer,
        "avatar_url": avatarUrl,
        "_links": links.toJson(),
      };
}

class Ing {
  const Ing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.postcode,
    required this.country,
    required this.state,
    required this.email,
    required this.phone,
  });

  final String firstName;
  final String lastName;
  final String company;
  final String address1;
  final String address2;
  final String city;
  final String postcode;
  final String country;
  final String state;
  final String email;
  final String phone;

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        postcode: json["postcode"],
        country: json["country"],
        state: json["state"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "postcode": postcode,
        "country": country,
        "state": state,
        "email": email == null ? null : email,
        "phone": phone,
      };
}

class Links {
  const Links({
    required this.self,
    required this.collection,
  });

  final List<Collection> self;
  final List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
      };
}

class Collection {
  const Collection({
    required this.href,
  });

  final String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class ValueClass {
  const ValueClass({
    required this.expires,
    required this.products,
  });

  final int expires;
  final List<dynamic> products;

  factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
        expires: json["expires"],
        products: List<dynamic>.from(json["products"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "expires": expires,
        "products": List<dynamic>.from(products.map((x) => x)),
      };
}
