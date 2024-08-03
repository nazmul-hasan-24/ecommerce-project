
import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_app/data/repogitory/recommended_product_repo.dart';
import 'package:test_app/model/product_model.dart';


class RecommendedProductController extends GetxController {
  
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({ required this.recommendedProductRepo});

bool _isLoading = false;
bool get isLoading => _isLoading;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;      

  Future <void> getRecommendedProductList() async{
    // _isLoading = true;
    // update();
    
    final Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).productList);
      log("Got recommended prooduct");
      _isLoading = false;
      update();
    } else{
      log(' Not got recommended prooduct');
    }
  }
int _quantity =0;
 int get quantity => _quantity;
 void incrementAndDecremnt(bool isIncrement){
  if(isIncrement || quantity<0){
    _quantity = _quantity+=1;
    log("Increment $_quantity");
    update();
  } else if(isIncrement || quantity>0){ 
    _quantity = _quantity -=1;
    log("Decrement $_quantity");
     update();
  }
 }



}
