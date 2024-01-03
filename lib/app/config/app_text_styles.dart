/* Copyright (C) 2023 MicroService Technologies - All Rights Reserved.
  * Email: info@microservice.com
  *
*/
//* Package
import 'package:ecommerce/app/config/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Collection of commonly used Text styles for consistent typography throughout the app.
class AppTextStyles {
  // Small-sized Text widget with a specified text and color.
  static sm(
      {String? text,
      Color? color,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return Text(
      textAlign: textAlign,
      text!,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: fontWeight,
        color: color ??
            (Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900]),
        // fontFamily:
      ),
    );
  }

  // Medium-sized Text widget with an optional text and color.
  static md({String? text, Color? color, TextAlign? textAlign}) {
    return Text(
      textAlign: textAlign,
      text!,
      style: TextStyle(
        fontSize: 16.sp,
        color: color ??
            (Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900]),
        // fontFamily:
      ),
    );
  }

  // Large-sized Text widget with a specified text and color.
  static lg({String? text, Color? color, TextAlign? textAlign}) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 20.sp,
        color: color ??
            (Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900]),
        // fontFamily:
      ),
    );
  }

  // Extra large-sized Text widget with a specified text and color.
  static xl({String? text, Color? color, TextAlign? textAlign}) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 24.sp,
        color: color ??
            (Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900]),
        // fontFamily:
      ),
    );
  }
}
