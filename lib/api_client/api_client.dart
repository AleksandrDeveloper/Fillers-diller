import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/modals.dart';
import '../modal/order_product.dart';
import '../modal/user_modal.dart';

class ApiClient {
  final client = http.Client();
  final _baseUrl = 'https://fillers-diller.ru';
  final _consumerKey = 'ck_2ab5c89962ef98cc8c241b67e9c29cac9d6d1fe2';
  final _consumerSecret = 'cs_c7f75335487d5b6c2d9e53a388781e8bcc725b37';

  Future<User> searchUser(int userId) async {
    final url =
        '$_baseUrl/wp-json/wc/v3/customers/$userId?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final requestJson =
          await jsonDecode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(requestJson);
      print('Это имя пользователя полученого из apiClient ${user.firstName}');
      return user;
    } else {
      throw Error();
    }
  }

  Future<bool> createOrder({
    required String firstName,
    required String lastName,
    required List<OrderProduct> orderProduct,
    required String adres,
    required String city,
    required String postCode,
    required String country,
    required String email,
    required String phone,
  }) async {
    final url =
        'https://fillers-diller.ru/wp-json/wc/v3/orders/?consumer_key=ck_2ab5c89962ef98cc8c241b67e9c29cac9d6d1fe2&consumer_secret=cs_c7f75335487d5b6c2d9e53a388781e8bcc725b37';
    var body = {
      "payment_method": "bacs",
      "payment_method_title": "Direct Bank Transfer",
      "set_paid": true,
      "billing": {
        "first_name": firstName,
        "last_name": lastName,
        "address_1": adres,
        "address_2": "",
        "city": city,
        "state": city,
        "postcode": postCode,
        "country": country,
        "email": email,
        "phone": phone
      },
      "shipping": {
        "first_name": firstName,
        "last_name": lastName,
        "address_1": adres,
        "address_2": "",
        "city": city,
        "state": city,
        "postcode": postCode,
        "country": country
      },
      "line_items": orderProduct,
      "shipping_lines": [
        {
          "method_id": "flat_rate",
          "method_title": "Flat Rate",
          "total": "10.00"
        }
      ]
    };
    var head = {"Content-Type": "application/json"};
    final request = await client.post(
      Uri.parse(url),
      headers: head,
      body: jsonEncode(body),
    );
    if (request.statusCode == 200) {
      print('получилось');
      return true;
    } else {
      print('не получилось');
      print(jsonEncode(body));
      return false;
    }
  }

  Future<String> authUser({
    required String userName,
    required String userPasword,
  }) async {
    final url = '$_baseUrl/wp-json/jwt-auth/v1/token';
    final response = await client.post(Uri.parse(url), body: {
      "username": userName,
      "password": userPasword,
    });

    if (response.statusCode == 200) {
      final requestJson =
          await jsonDecode(response.body) as Map<String, dynamic>;
      final userEmail = await requestJson['user_email'] as String;

      return userEmail;
    } else {
      throw Error();
    }
  }

  Future<int> authId({required String userEmail}) async {
    final url =
        '$_baseUrl/wp-json/wc/v3/customers/?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret&email=$userEmail';

    final responce = await client.get(Uri.parse(url));

    if (responce.statusCode == 200) {
      var reqestJson = await jsonDecode(responce.body) as List;
      final userId = await reqestJson.first['id'] as int;
      print('это id из apiClient $userId');
      return userId;
    } else {
      throw UnimplementedError('error');
    }
  }

  Future<List<Product>> getProduct() async {
    final url =
        '$_baseUrl/wp-json/wc/v3/products/?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret&per_page=100';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var reqestJson = jsonDecode(response.body) as List;

      List<Product> productJson =
          reqestJson.map((json) => Product.fromJson(json)).toList();

      return productJson;
    } else {
      throw UnimplementedError('error');
    }
  }

  Future<Product> getDeteilsProduct({required int productId}) async {
    final url =
        '$_baseUrl/wp-json/wc/v3/products/$productId?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final reqestJson = jsonDecode(response.body);

      final detailsProduct = Product.fromJson(reqestJson);

      return detailsProduct;
    } else {
      throw UnimplementedError('error');
    }
  }

  Future<List<Product>> getProductCategory({required int categoryId}) async {
    final url =
        '$_baseUrl/wp-json/wc/v3/products/?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret&category=$categoryId&per_page=60';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var reqestJson = jsonDecode(response.body) as List;

      List<Product> productJson =
          reqestJson.map((json) => Product.fromJson(json)).toList();
      print('это массив из apiClient ${productJson.length}');
      return productJson;
    } else {
      throw UnimplementedError('error');
    }
  }

  Future<List<Product>> getProductSearch({required String searchString}) async {
    final url =
        '$_baseUrl/wp-json/wc/v3/products/?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret&search=$searchString';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var reqestJson = jsonDecode(response.body) as List;

      List<Product> productJson =
          reqestJson.map((json) => Product.fromJson(json)).toList();
      print(productJson);
      return productJson;
    } else {
      throw UnimplementedError('error');
    }
  }

  Future<List<Product>> getProductFeatured() async {
    final url =
        '$_baseUrl/wp-json/wc/v3/products/?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret&featured=true';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var reqestJson = jsonDecode(response.body) as List;

      List<Product> productJson =
          reqestJson.map((json) => Product.fromJson(json)).toList();

      return productJson;
    } else {
      throw UnimplementedError('error');
    }
  }

  Future<List<Product>> getProductOnSale() async {
    final url =
        '$_baseUrl/wp-json/wc/v3/products/?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret&on_sale=true';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var reqestJson = jsonDecode(response.body) as List;

      List<Product> productJson =
          reqestJson.map((json) => Product.fromJson(json)).toList();

      return productJson;
    } else {
      throw UnimplementedError('error');
    }
  }

  Future<List<CategoryProduct>> getCategory() async {
    final url =
        '$_baseUrl/wp-json/wc/v3/products/categories/?consumer_key=$_consumerKey&consumer_secret=$_consumerSecret&per_page=65';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final categoryReqest = await jsonDecode(response.body) as List;
      List<CategoryProduct> categoryJson = categoryReqest
          .map((json) => CategoryProduct.fromJson(json as Map<String, dynamic>))
          .toList();

      return categoryJson;
    } else {
      throw Error();
    }
  }
}
