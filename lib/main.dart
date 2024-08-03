import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controlleers/cart_controller.dart';
import 'package:test_app/controlleers/popular_product_controller.dart';
import 'package:test_app/controlleers/recommended_product_controller.dart';
import 'package:test_app/helper/dependencies.dart' as dep;
import 'package:test_app/pages/home/main_food_page.dart';
import 'package:test_app/routes/route_helper.dart';
import 'package:test_app/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(
              Size(30, 30),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.all(10),
            ),
            backgroundColor:
                const WidgetStatePropertyAll(AppColors.mainColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        useMaterial3: true,
        
      ),
      // initialBinding: dep.init(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      home: const MainFoddPage(),
    );
  }
}
