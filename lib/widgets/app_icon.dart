import 'package:flutter/material.dart';
import 'package:test_app/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgrounColor;
  final VoidCallback onPressed;
  const AppIcon({
    super.key,
    required this.icon,
    this.size = 0,
    this.iconColor = const Color(0xFF756d54),
    this.backgrounColor = const Color(0xFFfcf4e4),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      style: IconButton.styleFrom(
        backgroundColor: backgrounColor,
        elevation: 0,
        minimumSize: Size(
          size == 0 ? Dimensions.height45 : size,
          size == 0 ? Dimensions.height45 : size,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.radius20,
          ),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: Dimensions.icon16,
        color: iconColor,
      ),
    );
  }
}
