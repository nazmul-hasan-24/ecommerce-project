import 'package:get/get.dart';
import 'package:test_app/data/repogitory/cart_repo.dart';
import 'package:test_app/model/cart_model.dart';
import 'package:test_app/model/product_model.dart';
import 'dart:developer';

import 'package:test_app/utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get itme => _items;

  void addItem(ProductModel product, int quantity) {
    log("Product id: ${product.id} product price ${product.price}");
    var totalQuantity =0;
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (CartModel value) {
          totalQuantity = value.quantity!+quantity;
          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExit: true,
            time: DateTime.now().toString(),
          );
        },
      );
    }
    if (quantity > 0) {
      _items.putIfAbsent(
        product.id!,
        () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
          );
        },
      );
    } else {
      Get.snackbar(
        "Item count",
        'Item at least add an item',
        backgroundColor: AppColors.mainColor,
        duration: const Duration(seconds: 3),
        isDismissible: true,
      );
    }
  }

  bool isExisted(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}
