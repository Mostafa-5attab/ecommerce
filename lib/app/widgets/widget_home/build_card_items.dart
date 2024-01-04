import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/config/app_sized_box_styles.dart';
import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:ecommerce/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCardItems extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  final double rating;

  const BuildCardItems(
      {super.key,
      required this.image,
      required this.price,
      required this.rating,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.r),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppPalette.grey[50],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.r,
                  blurRadius: 6.r)
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                    icon: Icons.favorite_border_outlined, onPressed: () {}),
                CustomIconButton(icon: Icons.add, onPressed: () {})
              ],
            ),
            // AppSizedBoxStyles.md(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                  height: 110.0.h,
                  width: double.infinity,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                children: [
                  AppSizedBoxStyles.md(),
                  AppTextStyles.sm(
                      text: title, textOverflow: TextOverflow.ellipsis , color: AppPalette.grey[900]),
                  AppSizedBoxStyles.md(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextStyles.sm(
                          text: "\$ $price", fontWeight: FontWeight.bold,color: AppPalette.grey[900]),
                      Container(
                        width: 45.w,
                        height: 17.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.r,),
                        decoration: BoxDecoration(
                            color: AppPalette.darkGreen[600],
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextStyles.sm(
                                text: "$rating", color: AppPalette.grey[50]),
                            Icon(
                              Icons.star,
                              size: 9.sp,
                              color: AppPalette.grey[50],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
