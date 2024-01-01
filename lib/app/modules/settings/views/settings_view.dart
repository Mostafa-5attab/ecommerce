import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Get.isDarkMode
                      ? Get.changeThemeMode(ThemeMode.light)
                      : Get.changeThemeMode(ThemeMode.dark);
                },
                child: AppTextStyles.md(
                  text: "dark Mode",
                  color: Get.isDarkMode ? Colors.blue : Colors.red,
                ),
              ),
              GetBuilder<SettingsController>(
                  init: SettingsController(),
                  builder: (controller) {
                    return TextButton(
                      onPressed: () {
                        controller.signOutFromApp();
                      },
                      child: AppTextStyles.md(
                        text: "Sign Out",
                        color: Get.isDarkMode ? Colors.blue : Colors.red,
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
