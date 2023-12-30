import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../config/app_palette.dart';

class ForgotPasswordController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  void resetPassword({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ");
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      }
      Get.snackbar(
        title,
        message,
        backgroundColor:
            Get.isDarkMode ? AppPalette.darkGreen[700] : AppPalette.red[600],
      );
    } catch (e) {
      print(e);
    }
  }
}
