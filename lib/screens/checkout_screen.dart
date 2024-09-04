import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/cart_provider.dart';
import 'package:task_app/widgets/order_summary.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.orangeAccent, // Light orange color
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: OrderSummary(cartProvider: cartProvider),
            ),
            const Spacer(),
            // Place Order Button
            ElevatedButton(
              onPressed: () {
                // Show a SnackBar when the button is pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Congratulations, your order has been placed!',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green, // Customize the color here
                    duration: Duration(seconds: 2), // Customize the duration
                    behavior: SnackBarBehavior.floating, // Optional: floating SnackBar
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent, // Light orange color
                padding: const  EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
