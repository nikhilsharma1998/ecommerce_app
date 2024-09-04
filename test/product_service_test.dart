import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/services/product_service.dart';
import 'package:task_app/models/product.dart';

void main() {
  group('ProductService', () {
    test('fetchProducts returns a list of products', () async {
      final productService = ProductService();
      final products = await productService.fetchProducts();

      expect(products, isA<List<Product>>());
      expect(products, isNotEmpty);
    });
  });
}
