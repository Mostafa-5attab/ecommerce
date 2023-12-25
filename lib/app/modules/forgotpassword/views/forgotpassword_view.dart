import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/config/app_sized_box_styles.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:ecommerce/app/widgets/custom_text_form_fied.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/RXP.dart';
import '../../../widgets/custom_outline_button_secondary.dart';
import '../controllers/forgotPassword_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900],
        appBar: AppBar(
          title: AppTextStyles.md(
            text: "Forgot Password",
            color: Get.isDarkMode
                ? AppPalette.darkGreen[700]
                : AppPalette.red[600],
          ),
          centerTitle: true,
          backgroundColor:
              Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextStyles.md(
                      textAlign: TextAlign.center,
                      text:
                          "if you want recover account, than please provide you email ID below ...",
                    ),
                    Image.asset("assets/image/forgotPassword.png"),
                    CustomTextFormField(
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return "Enter valid email ";
                        } else {
                          return null;
                        }
                      },
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      hintText: "Email",
                      filled: true,
                      textEditingController: emailController,
                      obscureText: false,
                    ),
                    AppSizedBoxStyles.xl(),
                    GetBuilder<ForgotPasswordController>(
                      init:  ForgotPasswordController(),
                        builder: (controller){
                      return CustomOutiLineButtonSecondary(
                        title: "SEND",
                        function: () {
                          if(formKey.currentState!.validate()){
                            String email = emailController.text.trim();
                            controller.resetPassword(email: email);
                          }
                        },
                        color: Get.isDarkMode
                            ? AppPalette.darkGreen[600]
                            : AppPalette.red[600],
                      );
                    }),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
