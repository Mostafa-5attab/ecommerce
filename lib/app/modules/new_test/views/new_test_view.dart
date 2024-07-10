import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_test_controller.dart';

class NewTestView extends GetView<NewTestController> {
  const NewTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewTestView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewTestView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
