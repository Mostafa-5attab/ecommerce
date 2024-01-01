//* Package
import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/config/app_sized_box_styles.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// * Local files
import '../../home/views/home_view.dart';
import '../../main_screen/views/main_screen_view.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/welcome_controller.dart';

// * Views

// * Widgets

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
                fit: BoxFit.cover,
                "https://img.freepik.com/free-photo/charming-lady-fashionable-blouse-trousers-takes-notes-tablet-girl-posing-background-dresses_197531-17619.jpg"),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppPalette.grey[900]!.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 240.h,
                ),
                Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: AppPalette.grey[900]!.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Center(
                    child: AppTextStyles.lg(
                      text: "Welocme",
                      color: AppPalette.grey[50],
                    ),
                  ),
                ),
                AppSizedBoxStyles.md(),
                Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: AppPalette.grey[900]!.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Center(
                      child: Row(
                    children: [
                      AppTextStyles.md(
                        text: "K",
                        color: AppPalette.darkGreen[600],
                      ),
                      AppSizedBoxStyles.smWidth(),
                      AppTextStyles.md(
                        text: "Shop",
                        color: AppPalette.grey[50],
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 200.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 13.w),
                      backgroundColor: AppPalette.darkGreen[600]),
                  onPressed: () {
                    Get.offAll(() => const MainScreenView());
                  },
                  child: AppTextStyles.md(
                    text: "Get Start",
                    color: AppPalette.grey[50]
                  ),
                ),
                AppSizedBoxStyles.lg(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextStyles.sm(text: "Don`t have an Acconut ?"),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => SignupView());
                      },
                      child: AppTextStyles.sm(
                        text: "Sigun Up",
                        color: AppPalette.darkGreen[700],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
