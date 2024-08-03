import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controlleers/popular_product_controller.dart';
import 'package:test_app/controlleers/recommended_product_controller.dart';
import 'package:test_app/model/product_model.dart';
import 'package:test_app/routes/route_helper.dart';
import 'package:test_app/utils/app_constant.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/dimensions.dart';
import 'package:test_app/widgets/app_column.dart';
import 'package:test_app/widgets/big_text.dart';
import 'package:test_app/widgets/icon_and_text_widget.dart';
import 'package:test_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final _scaleFactor = 0.80;
  final PageController _pageController = PageController(
    viewportFraction: 0.80,
  );

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  var _currentPageValue = 0.0;
  final _height = Dimensions.firstContainer;


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Page view builder
        GetBuilder<PopularProductController>(
          builder: (popularProductController) {
            return Visibility(
              visible: popularProductController.isLoading== false,
              replacement: SizedBox(
                height: Dimensions.firstContainer,
                child: const Center(child: CircularProgressIndicator( color: AppColors.mainBlackColor,),)),
              child: SizedBox(
                height: Dimensions.pageView,
                child: PageView.builder(
                  onPageChanged: (value) {
                    _currentIndex.value = value;
                  },
                  controller: _pageController,
                  itemCount: popularProductController.popularProductList.length,
                  itemBuilder: (context, int position) {
                    return _builderPageItem(position, popularProductController.popularProductList[position]);
                  },
                ),
              ),
            );
          }
        ),
        //dot indicator
        GetBuilder<PopularProductController>(
          builder: (popularProductController) {
            return ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Wrap(
                  spacing: Dimensions.margin10,
                  children: List.generate(
                    popularProductController.popularProductList.length,
                    (index) {
                      return Icon(
                        Icons.circle,
                        size: Dimensions.icon20,
                        color:
                            _currentPageValue == index ? Colors.cyan : Colors.grey,
                      );
                    },
                  ),
                );
              },
            );
          }
        ),
        SizedBox(
          height: Dimensions.height30,
        ),

        // recommended text
        Container(
          margin: EdgeInsets.only(left: Dimensions.margin30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.height10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 3,
                ),
                child: const BigText(
                  text: '.',
                ),
              ),
              SizedBox(
                width: Dimensions.height10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 2,
                ),
                child: const SmallText(
                  text: "Food pairing",
                ),
              )
            ],
          ),
        ),
        // List of food and image
        SizedBox(
          height: Dimensions.height20,
        ),
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProductController) {
            return Visibility(
              visible: recommendedProductController.isLoading== false,
              replacement:  Container(
                margin:const EdgeInsets.only(top: 130),
                child: const CircularProgressIndicator()),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProductController.popularProductList.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                  final im = recommendedProductController.popularProductList[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed(RouteHelper.getRecommendedFood(productId: index)),
                      child: Container(
                        // height: 200,
                        // width: 200,
                        color: Colors.white38,
                        margin: EdgeInsets.only(
                          left: Dimensions.height20,
                          right: Dimensions.height20,
                          bottom: Dimensions.height10,
                        ),
                        child: Row(
                          children: [
                            // Image container
                            Container(
                              height: Dimensions.listViewImgSize,
                              width: Dimensions.listViewImgSize,
                              // margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.radius20),
                                  image:  DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage('${AppConstant.baseUrl}${AppConstant.upload
                                      }${im.img}'))),
                            ),
                            // text container
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: Dimensions.margin10),
                                height: Dimensions.listViewTextContSize,
                                // width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     BigText(
                                        text: im.name??''),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    const SmallText(
                                        text: "With chinese characteristics"),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    const FittedBox(
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        // mainAxisAlignment: MainAxisAlignment.center,
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
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        )
      ],
    );
  }

  Widget _builderPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale = _scaleFactor +
          (_currentPageValue - index + 1) * (1 - _scaleFactor);

      double currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      double currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(RouteHelper.getPopularProduct( index)),
            child: Container(
              height: Dimensions.firstContainer,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(Dimensions.margin10)
                  .copyWith(top: Dimensions.margin15),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                shape: BoxShape.rectangle,
                image:   DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage( '${AppConstant.baseUrl}${AppConstant.upload}${popularProduct.img!}'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.secondContainer,
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  left: Dimensions.height10,
                  right: Dimensions.height10,
                  bottom: Dimensions.height15),
              // constraints: const BoxConstraints(minWidth: double.infinity),
              margin: EdgeInsets.only(
                left: Dimensions.margin25,
                right: Dimensions.margin25,
                bottom: Dimensions.margin20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    // blurRadius: 5.0,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    // blurRadius: 5.0,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child:  AppColoum(
                text: popularProduct.name??'',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
