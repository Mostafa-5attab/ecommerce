import 'package:ecommerce/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;

  var googleSignIn = GoogleSignIn();
  var displayUserName = '';
  var displayPhoto = '';

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
}
