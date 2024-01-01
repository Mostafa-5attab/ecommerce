import 'package:ecommerce/app/widgets/widget_home/build_card_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.8,
          mainAxisSpacing: 9.0.w,
          crossAxisSpacing: 6.0.h,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const BuildCardItems();
        },
      ),
    );
  }
}
