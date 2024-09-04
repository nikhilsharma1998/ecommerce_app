import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/cart_provider.dart';
import 'package:task_app/screens/cart_screen.dart';
import 'package:task_app/models/product.dart';

void main() {
  testWidgets('CartScreen displays cart items and navigates to checkout', (WidgetTester tester) async {
    final mockProduct = Product(
      id: 1,
      title: 'Product 1',
      price: 20.0,
      description: 'Description 1',
      imageUrl: 'https://example.com/product1.jpg',
      category: 'home'
    );

    final cartProvider = CartProvider();
    cartProvider.addToCart(mockProduct);

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => cartProvider,
        child: MaterialApp(home: CartScreen()),
      ),
    );

    // Verify that cart items are displayed
    expect(find.text('Product 1'), findsOneWidget);

    // Tap on checkout button
    await tester.tap(find.text('Checkout'));
    await tester.pumpAndSettle();

    // Verify that the checkout screen is displayed
    expect(find.text('Checkout'), findsOneWidget);
  });
}
