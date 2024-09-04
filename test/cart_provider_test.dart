import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/models/product.dart';
import 'package:task_app/providers/cart_provider.dart';

void main() {
  group('CartProvider', () {
    late CartProvider cartProvider;
    late Product testProduct;

    setUp(() {
      cartProvider = CartProvider();
      testProduct = Product(
        id: 1,
        title: 'Test Product',
        price: 10.0,
        description: 'Test Description',
        imageUrl: 'https://example.com/test.jpg',
              category: 'home'

      );
    });

    test('addToCart adds a product to the cart', () {
      cartProvider.addToCart(testProduct);
      expect(cartProvider.items, isNotEmpty);
    });

    test('removeFromCart removes a product from the cart', () {
      cartProvider.addToCart(testProduct);
      cartProvider.removeFromCart(testProduct);
      expect(cartProvider.items, isEmpty);
    });

    test('updateQuantity updates the quantity of a product in the cart', () {
      cartProvider.addToCart(testProduct);
      cartProvider.updateQuantity(testProduct, 3);
      final cartItem = cartProvider.items.firstWhere((item) => item.product == testProduct);
      expect(cartItem.quantity, 3);
    });
  });
}
