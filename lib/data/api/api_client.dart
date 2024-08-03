import 'package:get/get.dart';
import 'package:test_app/utils/app_constant.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token  = AppConstant.token;

  final String appBaseUrl;

  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    
    timeout = const Duration(seconds: 30);

    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
///   THIS IS FOR GET REQUEST
  Future<Response> getData(String uri) async {
    try {
      final Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusText: e.toString(), statusCode: -1);
    }
  }
}
