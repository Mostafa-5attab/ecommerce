// *Packages
import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/config/app_sized_box_styles.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:ecommerce/app/modules/login/views/login_view.dart';
import 'package:ecommerce/app/widgets/custom_outline_button_secondary.dart';
import 'package:ecommerce/app/widgets/custom_text_form_fied.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/RXP.dart';
import '../../../widgets/widget_signUp_and_login/container_under.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.colorScheme.background,
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
                                text: "Sign",
                                color: Get.isDarkMode
                                    ? AppPalette.red[600] : AppPalette.darkGreen[700] ,
                              ),
                              AppSizedBoxStyles.smWidth(),
                              AppTextStyles.lg(
                                  text: "Up",
                                  color: Get.isDarkMode
                                      ? AppPalette.grey[50]
                                      : AppPalette.grey[900]
                                      ),
                            ],
                          ),
                          AppSizedBoxStyles.xl(),
                          CustomTextFormField(
                            validator: (value) {
                              if (value.toString().length < 2 ||
                                  !RegExp(validationName).hasMatch(value)) {
                                return "Enter valid name ";
                              } else {
                                return null;
                              }
                            },
                            textInputType: TextInputType.name,
                            prefixIcon: Icons.account_circle_outlined,
                            hintText: "User Name",
                            filled: true,
                            textEditingController: nameController,
                            obscureText: false,
                          ),
                          AppSizedBoxStyles.md(),
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
                          AppSizedBoxStyles.md(),
                          GetBuilder<SignupController>(
                            init: SignupController(),
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
                          SizedBox(
                            height: 50.h,
                          ),
                          GetBuilder<SignupController>(
                            init: SignupController(),
                            builder: (controller) {
                              return CustomOutiLineButtonSecondary(
                                title: "SIGN UP",
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    String name = nameController.text.trim();
                                    String email = emailController.text.trim();
                                    String password = passwordController.text.trim();
                                    controller.signUpUserWithEmailAndPassword(
                                      name: name,
                                      email: email,
                                      password: password,
                                    );
                                  }
                                },

                              );
                            },
                          ),
                          AppSizedBoxStyles.xl(),
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
                          text: "Already have an Account? ",
                          color: AppPalette.grey[50],
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(() => LoginView());
                          },
                          child: AppTextStyles.md(
                            text: "Login",
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
