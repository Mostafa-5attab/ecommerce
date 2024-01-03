import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Services/product.dart';
import '../../../model/product_model.dart';

class HomeController extends GetxController {
  var productList = <ProductModels> [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProduct();
  }
  void getProduct() async {
    List<ProductModels> products = (await ProductServices.getProduct()) as List<ProductModels>;
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
