import 'package:get/get.dart';

import '../controllers/new_test_controller.dart';

class NewTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewTestController>(
      () => NewTestController(),
    );
  }
}
