import 'package:ecommerce/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: [
          AppTextStyles.xl(text: "khattab")
        ],
      ) ,
    );
  }
}
