import 'package:flutter/material.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor,
      this.iconSize = 0});
  final IconData icon;
  final String text;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize == 0 ? Dimensions.icon20 : iconSize,
          color: iconColor,
        ),
        const SizedBox(
          width: 3,
        ),
        SmallText(text: text),
        SizedBox(width: Dimensions.height5),
      ],
    );
  }
}
