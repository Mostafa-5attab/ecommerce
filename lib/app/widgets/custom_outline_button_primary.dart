/* Copyright (C) 2023 MicroService Technologies - All Rights Reserved.
  * Email: info@microservice.com
  *
*/
// * Packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// * Local files
import '../config/app_palette.dart';
import '../config/app_text_styles.dart';

// * Views
// * Widgets

// Custom OutlinedButton widget with flexible styling.
// Useful for creating buttons with a consistent outline style throughout the application.

class CustomOutiLineButtonPrimary extends StatelessWidget {

  final String title;
  final Function function ;

  const CustomOutiLineButtonPrimary({
    super.key,
    required this.title, required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
            padding:  EdgeInsets.all(16.0.r),
            textStyle:  TextStyle(fontSize: 28.sp,),
            side:  BorderSide(
              width: 1.w,
              color: AppPalette.blue,
            )),
        onPressed: () {
          function();
        },
        child: AppTextStyles.md(
            text: title, color: AppPalette.blue),
      ),
    );
  }
}
