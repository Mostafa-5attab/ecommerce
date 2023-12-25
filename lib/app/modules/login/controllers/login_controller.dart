import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../config/app_palette.dart';
import '../../../home.dart';

class LoginController extends GetxController {

  bool isVisibilty = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();

  var displayUserName = '';
  var displayPhoto = '';

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName = auth.currentUser!.displayName ?? "");
      update();
      Get.offAll(Home());
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ");
      String message = '';
      if (error.code == 'user-not-found') {
        message = "No user found for that email.";
        
        print('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        message = "Wrong password provided for that user.";
        print('Wrong password provided for that user.');
      }else{
        message = "fack";
      }
      Get.snackbar(
        title,
        message,
        backgroundColor:
            Get.isDarkMode ? AppPalette.darkGreen[700] : AppPalette.red[600],
      );
    }
  }

  void signUpWithGoogle() async {
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayPhoto = googleUser.photoUrl!;
      update();
      Get.offAll(Home());
    }catch(error){
      print("this the errorrrrrrrrrrrrrrrrrrrrrrrrrr????????????????????// ${error.toString()}");
      Get.snackbar(
        "Error",
        error.toString(),
        backgroundColor:
        Get.isDarkMode ? AppPalette.darkGreen[700] : AppPalette.red[600],
      );
    }
  }
}