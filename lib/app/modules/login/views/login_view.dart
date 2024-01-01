import 'package:ecommerce/app/config/app_sized_box_styles.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:ecommerce/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:ecommerce/app/modules/signup/views/signup_view.dart';
import 'package:ecommerce/app/widgets/custom_text_form_fied.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../config/app_palette.dart';
import '../../../utils/RXP.dart';
import '../../../widgets/custom_outline_button_secondary.dart';
import '../../../widgets/widget_signUp_and_login/container_under.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Padding(
                      padding: EdgeInsets.all(14.0.r),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80.h,
                          ),
                          Row(
                            children: [
                              AppTextStyles.xl(
                                text: "Log",
                                color: Get.isDarkMode
                                    ? AppPalette.red[600]
                                    : AppPalette.darkGreen[700],
                              ),
                              AppSizedBoxStyles.smWidth(),
                              AppTextStyles.lg(
                                  text: "In",
                                  color: Get.isDarkMode
                                      ? AppPalette.grey[50]
                                      : AppPalette.grey[900]),
                            ],
                          ),
                          AppSizedBoxStyles.xl(),
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
                            suffixIcon: null,
                          ),
                          AppSizedBoxStyles.md(),
                          GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller) {
                              return CustomTextFormField(
                                validator: (value) {
                                  if (value.toString().length < 7) {
                                    "Password should be longer or equal to 7 characters";
                                  } else {
                                    return null;
                                  }
                                },
                                textInputType: TextInputType.visiblePassword,
                                prefixIcon: Icons.lock_outline,
                                suffixIcon: controller.isVisibilty
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,
                                suffixIconFunction: () {
                                  controller.visibilty();
                                },
                                hintText: "PassWord",
                                filled: true,
                                textEditingController: passwordController,
                                obscureText:
                                    controller.isVisibilty ? false : true,
                              );
                            },
                          ),
                          AppSizedBoxStyles.xl(),
                          Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => ForgotPasswordView());
                                },
                                child:
                                    AppTextStyles.sm(text: "Forget Password?", color:Get.isDarkMode  ? AppPalette.grey[50] : AppPalette.grey[900] ),
                              )),
                          SizedBox(
                            height: 50.h,
                          ),
                          GetBuilder<LoginController>(builder: (controller) {
                            return CustomOutiLineButtonSecondary(
                              title: "LOGIN",
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password =
                                      passwordController.text.trim();
                                  controller.loginUserWithEmailAndPassword(
                                      email: email, password: password);
                                }
                              },
                            );
                          }),
                          AppSizedBoxStyles.xl(),
                          AppTextStyles.md(text: "OR"),
                          AppSizedBoxStyles.md(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<LoginController>(
                                  builder: (controller) {
                                return InkWell(
                                  onTap: () {
                                    controller.signUpWithGoogle();
                                  },
                                  child: Image.asset(
                                    "assets/image/facebook.png",
                                    height: 50.h,
                                    width: 50.w,
                                  ),
                                );
                              }),
                              AppSizedBoxStyles.smWidth(),
                              Image.asset(
                                "assets/image/google.png",
                                height: 50.h,
                                width: 50.w,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  ContainerUnder(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextStyles.md(
                          text: "Don`t have an Account? ",
                          color: AppPalette.grey[50],
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(() => SignupView());
                          },
                          child: AppTextStyles.md(
                            text: "Sing UP",
                            color: AppPalette.grey[50],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
