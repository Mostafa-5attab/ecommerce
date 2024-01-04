import 'package:ecommerce/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce/app/modules/main_screen/controllers/main_screen_controller.dart';
import 'package:ecommerce/app/modules/settings/controllers/settings_controller.dart';
import 'package:ecommerce/app/utils/theme.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: FirebaseAuth.instance.currentUser != null ||
                  authBox.read<bool>("auth") == true
              ? AppPages.mainScreen
              : AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeApp.light,
          darkTheme: ThemeApp.dark,
          themeMode: SettingsController().themeDataGet,
        );
      },
    );
  }
}
