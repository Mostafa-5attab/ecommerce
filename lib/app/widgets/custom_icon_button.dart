import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color? color;
  final double? iconSize;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        icon,
        size: iconSize?.sp ?? 20.sp ,
        color: color ,
      ),
    );
  }
}
