import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping/models/cart-item.model.dart';

class CartBloc extends ChangeNotifier {
  var cart = List<CartItemModel>();
  double total = 0;

  calculateTotal() {
    total = 0;
    cart.forEach((x) {
      total += (x.price * x.quantity);
    });
    notifyListeners();
  }

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItemModel item) {
    var id = item.id;
    cart.removeWhere((x) => x.id == id);
    calculateTotal();
  }

  itemInCart(CartItemModel item) {
    var result = false;
    cart.forEach((x) {
      if (x.id == item.id) result = true;
    });
    return result;
  }

  increase(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calculateTotal();
    }
  }

  get() {
    return cart;
  }
}
