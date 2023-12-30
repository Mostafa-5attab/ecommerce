import 'package:ecommerce/app/modules/category/views/category_view.dart';
import 'package:ecommerce/app/modules/favorites/views/favorites_view.dart';
import 'package:ecommerce/app/modules/home/views/home_view.dart';
import 'package:ecommerce/app/modules/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  final tabs = [
    HomeView(),
    const FavoritesView(),
    const CategoryView(),
    const SettingsView()
  ].obs;

  final title = ["Home", "Favorites", "Category", "Settings"].obs;

  final GetStorage boxStorage = GetStorage();
  final key = "isDarkModes";

  saveThemeDataInBox(bool isDark){
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromBox(){
    return boxStorage.read<bool>(key)?? false;
  }

  ThemeMode get themeDataGet => getThemeDataFromBox()?ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
      getThemeDataFromBox()?ThemeMode.light:ThemeMode.dark
    );
    saveThemeDataInBox(!getThemeDataFromBox());
  }


}
