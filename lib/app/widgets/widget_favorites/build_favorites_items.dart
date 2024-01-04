import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/config/app_sized_box_styles.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:ecommerce/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildFavItems extends StatelessWidget {
  const BuildFavItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.r),
      child: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                  width: 200.w,
                  height: 100.h,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        "https://ocdn.eu/images/pulscms/ZjI7MDA_/bb6b0f53264a0ae1d90067153c065aeb.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ),
            AppSizedBoxStyles.mdWidth(),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyles.sm(
                      text: "Title jdalfjjlsjffjsdljf djlsf",
                      color: Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900],
                      textOverflow: TextOverflow.ellipsis),
                  AppTextStyles.sm(
                      text: "\$100", textOverflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? AppPalette.grey[50] : AppPalette.grey[900]
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconButton(icon: Icons.favorite, onPressed: () {},color: AppPalette.red,iconSize: 30,),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
