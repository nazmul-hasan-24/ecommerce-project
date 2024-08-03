

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controlleers/recommended_product_controller.dart';
import 'package:test_app/routes/route_helper.dart';
import 'package:test_app/utils/app_constant.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/widgets/app_icon.dart';
import 'package:test_app/widgets/big_text.dart';
import 'package:test_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key, required this.productId});
final int productId;
  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().popularProductList[productId];
    return Scaffold(
      body: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 70,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.clear,
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
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(20),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius20,
                      ),
                    ),
                    child:  BigText(
                      text: product.name!,
                    ),
                  ),
                ),
                expandedHeight: 300,
                pinned: true,
                backgroundColor: AppColors.yellowColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    width: double.maxFinite,
                    AppConstant.baseUrl+AppConstant.upload+product.img!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.height20,
                    right: Dimensions.height20,
                  ),
                  child:  ExpandableTextWidget(
                    text: product.description??''
                  ),
                ),
              ),
            ],
          ),
       
      bottomNavigationBar: GetBuilder<RecommendedProductController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20 * 2.5,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppIcon(
                      size: Dimensions.icon24,
                      backgrounColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      icon: Icons.remove,
                      onPressed: () {
                        controller.incrementAndDecremnt(false);
                      },
                    ),
                     BigText(
                      text: "\$${product.price} X ${controller.quantity} )",
                      color: AppColors.mainBlackColor,
                    ),
                    AppIcon(
                      size: Dimensions.icon24,
                      backgrounColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      icon: Icons.add,
                      onPressed: () {
                        controller.incrementAndDecremnt(true);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: Dimensions.bottomHeight,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
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
                      child: Icon(
                        color: AppColors.mainColor,
                        Icons.favorite,
                        size: Dimensions.icon24,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                      ),
                      child:  BigText(
                        text: "\$${product.price} | Add to card",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
