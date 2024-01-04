import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/config/app_sized_box_styles.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:ecommerce/app/widgets/widget_home/card_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_text_form_fied.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Column(
        children: [
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? AppPalette.grey[900]
                    : AppPalette.darkGreen[600],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r))),
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyles.xl(
                      text: "Find You", color: AppPalette.grey[50]),
                  AppTextStyles.xl(
                      text: "INSPIRATION", color: AppPalette.grey[50]),
                  AppSizedBoxStyles.lg(),
                  CustomTextFormField(
                    validator: (value) {},
                    textInputType: TextInputType.text,
                    prefixIcon: Icons.search,
                    prefixIconColor: Get.isDarkMode
                        ? AppPalette.grey[900]
                        : AppPalette.darkGreen[600],
                    hintText: "Search",
                    filled: true,
                    textEditingController: search,
                    obscureText: false,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0.r),
            child: Align(
              alignment: Alignment.topLeft,
              child: AppTextStyles.xl(
                text: "Categories",
              ),
            ),
          ),
          const CardItem(),
        ],
      ),
    );
  }
}
