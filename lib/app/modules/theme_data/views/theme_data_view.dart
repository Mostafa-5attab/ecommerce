import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/theme_data_controller.dart';

class ThemeDataView extends GetView<ThemeDataController> {
  const ThemeDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeDataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ThemeDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
