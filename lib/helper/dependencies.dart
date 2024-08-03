import 'package:get/get.dart';
import 'package:test_app/controlleers/cart_controller.dart';
import 'package:test_app/controlleers/popular_product_controller.dart';
import 'package:test_app/controlleers/recommended_product_controller.dart';
import 'package:test_app/data/api/api_client.dart';
import 'package:test_app/data/repogitory/cart_repo.dart';
import 'package:test_app/data/repogitory/popular_product_repogitory.dart';
import 'package:test_app/data/repogitory/recommended_product_repo.dart';
import 'package:test_app/utils/app_constant.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.baseUrl));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
 Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}
