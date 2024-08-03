import 'package:get/get.dart';
import 'package:test_app/model/cart_model.dart';
import 'package:test_app/model/product_model.dart';

class RecommendedCartController extends GetxController{ 

 Map<int, CartModel> _items ={};
 Map<int, CartModel> get items => _items;

 void addItem(ProductModel product, int quantity){
  _items.putIfAbsent(product.id!, (){
    return CartModel( 
      id: product.id,
      name: product.name,
      price: product.price,
      quantity: quantity,
      img: product.img,
      isExit: true,
      time: DateTime.now().toString()

    );
  });
 }

 
}