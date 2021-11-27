import 'dart:convert';

import 'package:http/http.dart' as http;

import './../others/all.dart';

class APIservice {
  final http.Client _client = http.Client();

  Future<List<Category>> ctaegoryapi() async {
    List<Category> _categorylist = [];
    http.Response _response = await _client.get(Uri.parse(categoryapistg));
    if (_response.statusCode == 200) {
      final _body = jsonDecode(_response.body);
      _categorylist = (_body["categories"] as List<dynamic>)
          .map((catelist) => Category.fromJason(catelist))
          .toList();
      return _categorylist;
    } else {
      return _categorylist;
    }
  }

  Future<List<Product>> productapi() async {
    List<Product> _productlist = [];
    http.Response _response = await _client.get(Uri.parse(productapistg));
    if (_response.statusCode == 200) {
      final _body = jsonDecode(_response.body);
      _productlist = (_body["products"] as List<dynamic>)
          .map((catelist) => Product.fromJason(catelist))
          .toList();
      return _productlist;
    } else {
      return _productlist;
    }
  }

  registerapi(
    String name,
    String email,
    String password,
    Function done,
    Function already,
  ) async {
    http.Response _response = await _client.post(
      Uri.parse(registerapistg),
      body: {
        "name": name,
        "email": email,
        "password": password,
      },
    );
    if (_response.statusCode == 201 || _response.statusCode == 200) {
      final _body = jsonDecode(_response.body);
      done(_body["token"]);
    } else if (_response.statusCode == 422) {
      final _body = jsonDecode(_response.body);
      already(_body["errors"]["email"][0].toString());
    } else {
      already("Something is Wrong Please connect to the Developer !");
    }
  }

  loginapi(
    String email,
    String password,
    Function done,
    Function notfound,
  ) async {
    http.Response _response = await _client.post(
      Uri.parse(loginapistg),
      body: {
        "email": email,
        "password": password,
      },
    );
    if (_response.statusCode == 200) {
      final _body = jsonDecode(_response.body);
      done(_body["token"]);
    } else {
      notfound("Please Enter the Valide Credentials !");
    }
  }
}
