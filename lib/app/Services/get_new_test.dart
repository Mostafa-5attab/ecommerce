import 'dart:convert';

import 'package:ecommerce/app/model/new_model.dart';
import 'package:http/http.dart' as http;

import '../utils/RXP.dart';

class getTest {
  static Future<List<NewModel>> getNew(int id) async {
    var response = await http.get(
      Uri.parse("https://rickandmortyapi.com/api/character/$id}"),
    );

    if (response.statusCode == 200) {
      var jsonData = response.body;

      List<dynamic> decodedData = jsonDecode(jsonData);

      List<NewModel> products = decodedData.map((item) {
        return NewModel.fromJson(item as Map<String, dynamic>);
      }).toList();

      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}