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
      // Parse the JSON string into a List<Map<String, dynamic>>
      List<dynamic> decodedData = jsonDecode(jsonData);

      // Map each item in the list to a ProductModels object
      List<ProductModels> products = decodedData.map((item) {
        return ProductModels.fromJson(item as Map<String, dynamic>);
      }).toList();

      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
