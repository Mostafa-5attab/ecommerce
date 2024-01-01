import 'package:ecommerce/app/config/app_palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../login/controllers/login_controller.dart';
import '../../main_screen/views/main_screen_view.dart';

class SignupController extends GetxController {
  bool isVisibilty = false;
  var displayUserName = '';
  var displayPhoto = '';

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void signUpUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      isSignIn =true;
      authBox.write("auth", isSignIn);
      update();
      Get.offAll(MainScreenView());
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ");
      String message = '';
      if (error.code == 'user-not-found') {
        message = "No user found for that email.";
        print('No user found for that email.');
      } else {
        message = "fack you";
        print("this is the error ${error.code}");
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

  // void signUpWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //   displayUserName = googleUser!.displayName!;
  //   displayPhoto = googleUser.photoUrl!;
  //   isSignIn = true;
  //   update();
  // }
}
