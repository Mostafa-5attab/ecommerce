import 'package:ecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:ecommerce/app/widgets/widget_home/build_card_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: controller.productList.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.6,
              mainAxisSpacing: 9.0.h,
              crossAxisSpacing: 6.0.w,
              maxCrossAxisExtent: 200.h,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  print(index);
                },
                child: BuildCardItems(
                  image: controller.productList[index].image,
                  price: controller.productList[index].price,
                  rating: controller.productList[index].rating.rate,
                  title: controller.productList[index].title,
                ),
              );
            },
          ),
        );
      }
    });
  }
}
