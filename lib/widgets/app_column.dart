import 'package:flutter/material.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/widgets/big_text.dart';
import 'package:test_app/widgets/icon_and_text_widget.dart';
import 'package:test_app/widgets/small_text.dart';

class AppColoum extends StatelessWidget {
  const AppColoum({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              // spacing: 0.3,
              children: List.generate(
                5,
                (index) => Icon(
                  textDirection: TextDirection.ltr,
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.icon15,
                ),
              ),
            ),
            const SmallText(text: '4.5'),
            SizedBox(
              width: Dimensions.height10,
            ),
            const SmallText(text: '189'),
            SizedBox(
              width: Dimensions.height10,
            ),
            const SmallText(text: 'Commends'),
          ],
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        const Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.4km",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "12 min",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
