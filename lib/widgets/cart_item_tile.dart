import 'package:flutter/material.dart';
import 'package:task_app/models/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/cart_provider.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  const CartItemTile({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            cartItem.product.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          cartItem.product.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '\$${cartItem.total.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.orangeAccent),
              onPressed: () {
                if (cartItem.quantity > 1) {
                  Provider.of<CartProvider>(context, listen: false)
                      .updateQuantity(cartItem.product, cartItem.quantity - 1);
                }
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                cartItem.quantity.toString(),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.orangeAccent),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .updateQuantity(cartItem.product, cartItem.quantity + 1);
              },
            ),
            IconButton(
            icon: const  Icon(Icons.delete),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .removeFromCart(cartItem.product);
            },
          ),
          ],
        ),
      ),
    );
  }
}
