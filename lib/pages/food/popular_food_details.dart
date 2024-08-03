import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controlleers/cart_controller.dart';
import 'package:test_app/controlleers/popular_product_controller.dart';
import 'package:test_app/routes/route_helper.dart';
import 'package:test_app/utils/app_constant.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/widgets/app_column.dart';
import 'package:test_app/widgets/app_icon.dart';
import 'package:test_app/widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

import '../../utils/dimensions.dart';

class PopularFoodDetails extends StatelessWidget {
 const  PopularFoodDetails({super.key, required this.typeId});
  final int typeId ;

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[typeId];
    Get.find<PopularProductController>().initialProduct(product, Get.find<CartController>());
    log("id ${product.id}");
    log("Product Name ${product.name}");
    return Scaffold(
      body: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImageSize,
              width: double.infinity,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                   AppConstant.baseUrl+AppConstant.upload+product.img!,
                  ),
                ),
              ),
            ),
          ),
          //icon widget
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            // bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  onPressed: () {
                    Get.toNamed(RouteHelper.initial);
                  },
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          //introduction fodd
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageSize - Dimensions.height30,
            child: Container(
              // height: 400,
              constraints: const BoxConstraints(maxHeight: double.infinity),
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Dimensions.height20,
                  ),
                  topRight: Radius.circular(
                    Dimensions.height20,
                  ),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   AppColoum(
                    text: product.name??'',
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  const BigText(text: "Intorduce"),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                   Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:product.description??''
                    )),
                  ),
                ],
              ),
            ),
          ),
          //
        ],
      ),
      //bottom navigation bar
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (itemController) {
          return Container(
            height: Dimensions.bottomHeight,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10,
            ),
            decoration: BoxDecoration(
              color: AppColors.paraColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  Dimensions.height20 * 2,
                ),
                topRight: Radius.circular(
                  Dimensions.height20 * 2,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius20,
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          itemController.incrementAndDecremnt(false);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.signtColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.widht10 / 2,
                      ),
                       BigText(text: '${itemController.incartItems}'),
                      SizedBox(
                        width: Dimensions.widht10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          itemController.incrementAndDecremnt(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signtColor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    itemController.addItem(product);
                  },
                  child: Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                      ),
                      child:  BigText(text: "\$${product.price} | Add to card")),
                )
              ],
            ),
          );
        }
      ),
      backgroundColor: Colors.white,
    );
  }
}
