import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/app_palette.dart';
import '../../config/app_text_styles.dart';

class ContainerUnder extends StatelessWidget {
  final Widget title;

  const ContainerUnder({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60.h,
        transformAlignment: AlignmentDirectional.bottomEnd,
        decoration: BoxDecoration(
            color: Get.isDarkMode
                ? AppPalette.red[600]
                : AppPalette.darkGreen[600],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r))),
        child: Center(
          child: title,
        ));
  }
}
