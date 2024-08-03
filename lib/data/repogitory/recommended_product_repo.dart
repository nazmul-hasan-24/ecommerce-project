import 'package:get/get.dart';
import 'package:test_app/data/api/api_client.dart';
import 'package:test_app/utils/app_constant.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
 RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstant.recommendedProductUri);
  }
}


// class Re extends GetxService{ 
//   final ApiClient apiClient;

//   Re({required this.apiClient});
//   Future<Response> getReProL() async{
//     return await apiClient.getData(Appconstant.recommendedProductUri);
//   }
// }