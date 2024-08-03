import 'package:get/get.dart';
import 'package:test_app/data/api/api_client.dart';
import 'package:test_app/utils/app_constant.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstant.popularProductUri);
  }
}
