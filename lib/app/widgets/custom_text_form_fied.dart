/* Copyright (C) 2023 MicroService Technologies - All Rights Reserved.
  * Email: info@microservice.com
  *
*/

// * Packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// * Local files
import '../config/app_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final double? width;
  final TextInputType? textInputType;
  final bool? filled;
  final IconData? prefixIcon;
  final Color? prefixIconColor;

  final IconData? suffixIcon;
  final String? hintText;
  final TextEditingController textEditingController;
  final Function validator;
  final Function? suffixIconFunction;

  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.textInputType,
    this.width,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    required this.textEditingController,
    required this.validator,
    this.suffixIconFunction,
    required this.obscureText,
    this.prefixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width?.w ?? double.infinity,
          child: TextFormField(
            style: TextStyle(color: AppPalette.grey[900]),
            validator: (value) {
              return validator(value);
            },
            controller: textEditingController,
            keyboardType: textInputType,
            cursorColor: AppPalette.grey[600],
            obscureText: obscureText,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Get.isDarkMode
                    ? AppPalette.grey[700]
                    : AppPalette.grey[700],
              ),
              filled: filled,
              fillColor:
                  Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[200],
              // suffixIcon: IconButton(
              //   onPressed: () {
              //     suffixIconFunction!();
              //   },
              //   icon: Icon(suffixIcon),
              //   color: AppPalette.grey[900],
              // ),
              prefixIcon: Icon(
                prefixIcon,
                color: prefixIconColor ??
                    (Get.isDarkMode
                        ? AppPalette.red[600]
                        : AppPalette.darkGreen[600]),
              ),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0.r)),
                borderSide: BorderSide(
                    color: (Get.isDarkMode
                        ? AppPalette.grey[50]
                        : AppPalette.grey[200])!),
              ),
              // fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0.r),
                borderSide: BorderSide(
                  color: (Get.isDarkMode
                      ? AppPalette.grey[50]
                      : AppPalette.grey[200])!,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0.r),
                borderSide: BorderSide(
                  color: (Get.isDarkMode
                      ? AppPalette.grey[50]
                      : AppPalette.grey[200])!,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0.r),
                borderSide: BorderSide(
                  color: (Get.isDarkMode
                      ? AppPalette.grey[50]
                      : AppPalette.grey[200])!,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
