import 'package:flutter/material.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool isHiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.8,
              color: AppColors.paraColor,
              text: firstHalf,
              size: Dimensions.fontSize16,
            )
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  color: AppColors.paraColor,
                  size: Dimensions.fontSize16,
                  text: isHiddenText
                      ? ("$firstHalf...")
                      : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        isHiddenText = !isHiddenText;
                      },
                    );
                  },
                  child: Row(
                    children: [
                      isHiddenText
                          ? const SmallText(
                              text: "Show more",
                              color: AppColors.mainColor,
                            )
                          : const SmallText(
                              text: "Show less",
                              color: AppColors.mainColor,
                            ),
                      Icon(
                        isHiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
