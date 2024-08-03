
import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_app/controlleers/cart_controller.dart';
import 'package:test_app/model/product_model.dart';
import 'package:test_app/utils/colors.dart';

import '../data/repogitory/popular_product_repogitory.dart';

class PopularProductController extends GetxController {

  final PopularProductRepo popularProductRepo;
  PopularProductController({ required this.popularProductRepo});

  late CartController _cart;

bool _isLoading = false;
bool get isLoading => _isLoading;

int _quantity =0;
int get quantity => _quantity;

int _inCartItems =0;
int get incartItems=> _inCartItems + _quantity;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
//Get popular product
  Future <bool> getPopularProductList() async{
    _isLoading = true;
    update();
    final Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).productList);
      log("Got prooduct");
      _isLoading = false;
      update();
      return true;
    } else{
      log(' Not got prooduct');
      return false;
    }
  }
  // increment and decrement fun
void incrementAndDecremnt(bool isIncrement){
if(isIncrement){
 
  _quantity = checkQuantity(_quantity +=1);
   log('Increment $_quantity');
  update();
} else{
   _quantity = checkQuantity(_quantity -=1);
    log('Decrement $_quantity');
  update();
}
}
// check increment and decrement fun
int checkQuantity(int quantity){
  if(( _inCartItems +quantity)<0){
    print("Item 0 $_quantity");
    Get.snackbar("Can't reduce", 'Add at least 1' , backgroundColor: AppColors.mainColor, );
    return 0;
  } else if((_inCartItems +quantity)>20){
     Get.snackbar("Can't add", 'You can not add more then 20' , backgroundColor: AppColors.mainColor, );
    return 20;
  } else{
    return quantity;
  }
}
void initialProduct(ProductModel product,CartController cart){
  _quantity = 0;
  _inCartItems =0;
  _cart = cart;
  var exist = false;
  exist = _cart.isExisted(product);
  if(exist){
    _inCartItems = _cart.getQuantity(product);
  }
  log("the quantity in the cart is $_inCartItems");
}

void addItem(ProductModel product){
//  if(_quantity>0){

   _cart.addItem(product, _quantity);
   _quantity=0;
   _inCartItems =_cart.getQuantity(product);
   _cart.itme.forEach((key, value) { 
    log('Id is ${value.id} and quantity${value.quantity}');
   });
//  } else{
//    Get.snackbar("Can't add", 'Add at least 1 item' , backgroundColor: AppColors.mainColor, );
//  }
}
}
