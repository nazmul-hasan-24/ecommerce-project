import 'package:flutter/material.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextOverflow overflow;
  final double height;

  const BigText(
      {super.key,
      required this.text,
      this.color = AppColors.mainBlackColor,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.fontSize20 : size,
        height: height,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
