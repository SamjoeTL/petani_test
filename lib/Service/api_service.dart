import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:json_to_list_flutter/home_page.dart';

class APIService {
  static Future getProduct() async {
    try {
      final response = await http.get(Uri.parse(
          'https://66181cb69a41b1b3dfbc48bb.mockapi.io/products/products'));

      if (response.statusCode == 200) {
        final body = response.body;
        final result = jsonDecode(body);
        print(result);
        List<LaptopProduct> products = List<LaptopProduct>.from(
          result.map(
            (product) => LaptopProduct.fromJson(product),
          ),
        );
        return products;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}