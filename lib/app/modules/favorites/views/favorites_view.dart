import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/widget_favorites/build_favorites_items.dart';
import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Column(
        children: [
          AppTextStyles.sm(text: "mostaf")
        ],
      ),
      // body: ListView.separated(
      //     itemBuilder: (context, index) {
      //       return const BuildFavItems();
      //     },
      //     separatorBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 40),
      //         child: Divider(
      //           color: Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900],
      //           thickness: 1.h,
      //
      //         ),
      //       );
      //     },
      //     itemCount: 10),
    );
  }
}
