import 'package:get/get.dart';

import '../controllers/theme_data_controller.dart';

class ThemeDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeDataController>(
      () => ThemeDataController(),
    );
  }
}
