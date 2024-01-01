import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../config/app_palette.dart';
import '../../../config/app_text_styles.dart';
import '../../../widgets/custom_icon_button.dart';
import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MainScreenController());
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.colorScheme.background,
            appBar: AppBar(
              elevation: 0,
              title: AppTextStyles.md(
                text: controller.title[controller.currentIndex.value],
                color:AppPalette.grey[50],
              ),
              actions: [
                CustomIconButton(
                  icon: Icons.shopping_bag_outlined,
                  color: AppPalette.grey[50],
                  onPressed: () {

                  },
                ),
              ],
              centerTitle: true,
              backgroundColor: Get.isDarkMode
                  ? AppPalette.grey[900]
                  : AppPalette.darkGreen[600],
            ),
            bottomNavigationBar: Container(
              color:
                  Get.isDarkMode ? AppPalette.grey[800] : AppPalette.grey[100],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                child: GNav(
                  gap: 10.w,
                  // backgroundColor: (Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[800])!,
                  color: Get.isDarkMode
                      ? AppPalette.grey[50]
                      : AppPalette.grey[900],
                  textStyle: TextStyle(fontSize: 10.sp),
                  iconSize: 15.sp,
                  activeColor: Get.isDarkMode
                      ? AppPalette.grey[50]
                      : AppPalette.grey[900],
                  tabBackgroundColor: (Get.isDarkMode
                      ? AppPalette.grey[700]
                      : AppPalette.darkGreen[600])!,
                  padding: EdgeInsets.all(12.r),
                  tabs: [
                    GButton(
                      textStyle: TextStyle(
                          color: AppPalette.grey[50], fontSize: 20.sp),
                      iconSize: 25.sp,
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      textStyle: TextStyle(
                          color: AppPalette.grey[50], fontSize: 20.sp),
                      iconSize: 25.sp,
                      icon: Icons.favorite,
                      text: 'Profile',
                    ),
                    GButton(
                      textStyle: TextStyle(
                          color: AppPalette.grey[50], fontSize: 20.sp),
                      iconSize: 25.sp,
                      icon: Icons.category,
                      text: 'Category',
                    ),
                    GButton(
                      textStyle: TextStyle(
                          color: AppPalette.grey[50], fontSize: 20.sp),
                      iconSize: 25.sp,
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                  ],
                  onTabChange: (index) {
                    controller.changeIndex(index);
                  },
                ),
              ),
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}
