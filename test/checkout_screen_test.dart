import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/cart_provider.dart';
import 'package:task_app/screens/checkout_screen.dart';
import 'package:task_app/widgets/order_summary.dart';
import 'package:task_app/models/product.dart';

void main() {
  testWidgets('CheckoutScreen displays order summary and shows snack bar on order placement', (WidgetTester tester) async {
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
        child: MaterialApp(home: CheckoutScreen()),
      ),
    );

    // Verify that order summary is displayed
    expect(find.byType(OrderSummary), findsOneWidget);

    // Tap on place order button
    await tester.tap(find.text('Place Order'));
    await tester.pumpAndSettle();

    // Verify that the snack bar is shown
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Congratulations, your order has been placed.'), findsOneWidget);
  });
}
