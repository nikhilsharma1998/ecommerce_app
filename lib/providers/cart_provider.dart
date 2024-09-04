import 'package:flutter/material.dart';
import 'package:task_app/services/cart_service.dart';
import 'package:task_app/models/cart_item.dart';
import 'package:task_app/models/product.dart';

class CartProvider with ChangeNotifier {
  final CartService _cartService = CartService();

  List<CartItem> get items => _cartService.items;
  double get subtotal => _cartService.subtotal;

  void addToCart(Product product) {
    _cartService.addToCart(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartService.removeFromCart(product);
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    _cartService.updateQuantity(product, quantity);
    notifyListeners();
  }
}
