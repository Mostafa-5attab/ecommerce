import 'package:ecommerce/app/config/app_palette.dart';
import 'package:ecommerce/app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCardItems extends StatelessWidget {
  const BuildCardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.r),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                    icon: Icons.favorite_border_outlined, onPressed: () {}),
                CustomIconButton(icon: Icons.add, onPressed: () {})
              ],
            ),
            Image.network(
                "",
            )
          ],
        ),
      ),
    );
  }
}
