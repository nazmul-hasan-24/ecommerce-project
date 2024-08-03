import 'package:get/get.dart';
import 'package:test_app/pages/food/popular_food_details.dart';
import 'package:test_app/pages/food/recommended_food_detail.dart';
import 'package:test_app/pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => ' $initial';
  static String getPopularProduct(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood({required int productId}) =>
      '$recommendedFood?productId=$productId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFoddPage()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(
          typeId: int.parse(pageId!),
        );
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var productId = Get.parameters['productId'];
        return RecommendedFoodDetail(
          productId: int.parse(productId!),
        );
      },
      transition: Transition.fadeIn,
    )
  ];
}
