import 'dart:convert';

import 'package:ecommerce/app/utils/RXP.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(
      Uri.parse("$baseUrl/products"),
    );

    if (response.statusCode == 200) {
      var jsonData = response.body;

      List<dynamic> decodedData = jsonDecode(jsonData);

      List<ProductModels> products = decodedData.map((item) {
        return ProductModels.fromJson(item as Map<String, dynamic>);
      }).toList();

      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
