import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/product_provider.dart';
import 'package:task_app/screens/product_list_screen.dart';
import 'package:task_app/models/product.dart';

class MockProductProvider extends Mock implements ProductProvider {}

void main() {
  testWidgets('ProductListScreen displays products and handles scroll',
      (WidgetTester tester) async {
    // Create a mock provider
    final mockProductProvider = MockProductProvider();

    // Define test products
    final testProducts = [
      Product(
          id: 1,
          title: 'Product 1',
          price: 10.0,
          description: 'Description 1',
          imageUrl: 'http://example.com/image1.jpg',
          category: 'electronics'),
      Product(
          id: 2,
          title: 'Product 2',
          price: 20.0,
          description: 'Description 2',
          imageUrl: 'http://example.com/image2.jpg',
          category: 'clothing'),
    ];

    // Set up the mock to return test products
    when(mockProductProvider.products).thenReturn(testProducts);
    when(mockProductProvider.hasMoreProducts).thenReturn(true);

    // Build our widget and trigger a frame
    await tester.pumpWidget(
      ChangeNotifierProvider<ProductProvider>.value(
        value: mockProductProvider,
        child: MaterialApp(
          home: ProductListScreen(),
        ),
      ),
    );

    // Verify products are displayed
    expect(find.text('Product 1'), findsOneWidget);
    expect(find.text('Product 2'), findsOneWidget);

    // Scroll to trigger more products
    final scrollable = find.byType(Scrollable);
    await tester.drag(scrollable, Offset(0, -300));
    await tester.pump(); // Trigger a frame to process the scroll

    // Verify loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
