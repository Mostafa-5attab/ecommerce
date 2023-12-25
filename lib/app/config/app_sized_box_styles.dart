/* Copyright (C) 2023 MicroService Technologies - All Rights Reserved.
  * Email: info@microservice.com
  *
*/
//* Package
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Collection of commonly used SizedBox configurations for consistent spacing throughout the app.

class AppSizedBoxStyles{

  // Small-sized SizedBox with a height of 4.w.
  static  sm() =>  SizedBox(
    height: 4.w,
  );

  // Medium-sized SizedBox with a height of 8.w.
  static md() =>  SizedBox(
    height: 8.w,
  );

  // Large-sized SizedBox with a height of 20.w.
  static lg() =>  SizedBox(
    height: 20.w,
  );

  // Extra large-sized SizedBox with a height of 24.w.
  static xl() =>  SizedBox(
    height: 24.w,

  );

  // SizedBox with a specific width of 5.w.
  static smWidth () =>SizedBox(
    width: 5.w,
  );
  static mdWidth () =>SizedBox(
    width: 10.w,
  );
}

