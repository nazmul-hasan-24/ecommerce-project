import 'package:flutter/material.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  const SmallText(
      {super.key,
      required this.text,
      this.color = AppColors.textColor,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis,
      this.height = 1.2});
  final String text;
  final Color color;
  final double size;
  final TextOverflow overflow;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      // maxLines: 2,
      textAlign: TextAlign.justify,
      text,
      // overflow: overflow,
      style: TextStyle(
        inherit: false,
        fontSize: size == 0 ? Dimensions.fontSize15 : size,
        fontFamily: 'Roboto',
        color: color,
        height: height,
      ),
    );
  }
}
