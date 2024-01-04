import 'package:ecommerce/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {

  var displayUserName = '';
  var displayPhoto = '';
  final GetStorage boxStorage = GetStorage();
  final key = "isDarkModes";

  void signOutFromApp()async{
    await auth.signOut();
    await googleSignIn.signOut();
    isSignIn = false;
    authBox.remove("auth");
    update();
    Get.offNamed(Routes.WELCOME);
    displayUserName = "";
    displayPhoto = "";
  }



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
