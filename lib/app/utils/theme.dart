import 'package:ecommerce/app/config/app_palette.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static final light = ThemeData(
    primaryColor:AppPalette.grey[50],
    colorScheme: const ColorScheme.light(
      background: Colors.white,
        brightness: Brightness.light
    ),
  );

  static final dark = ThemeData(
    primaryColor: AppPalette.grey[900],
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      brightness: Brightness.dark, // تحديد brightness هنا
    ),
  );
}
