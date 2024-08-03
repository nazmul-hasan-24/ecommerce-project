import 'package:flutter/material.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/widgets/big_text.dart';
import 'package:test_app/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoddPage extends StatefulWidget {
  const MainFoddPage({super.key});

  @override
  State<MainFoddPage> createState() => _MainFoddPageState();
}

class _MainFoddPageState extends State<MainFoddPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //Header
            Container(
              padding: const EdgeInsets.all(11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Bnagladesh",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Country",
                            size: 15,
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.search,
                      size: Dimensions.icon24,
                    ),
                  ),
                ],
              ),
            ),
            //body
          const Expanded(
            child: SingleChildScrollView(child: FoodPageBody(),),
          ),
          
          ],
        ),
      ),
    );
  }
}
