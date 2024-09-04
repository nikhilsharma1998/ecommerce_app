import 'package:flutter/material.dart';
import 'package:task_app/services/product_service.dart';
import 'package:task_app/models/product.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _hasMoreProducts = true;
  int _currentPage = 1;
  String _selectedCategory = 'All'; // Track the selected category

  List<Product> get products => _filteredProducts.isNotEmpty ? _filteredProducts : _products;
  bool get hasMoreProducts => _hasMoreProducts;
  int get currentPage => _currentPage;
  List<Product> get filteredProducts => _filteredProducts;

  Future<void> fetchProducts({int page = 1}) async {
    if (!_hasMoreProducts && page != 1) return;

    try {
      final newProducts = await _productService.fetchProducts(page: page);
      if (newProducts.isEmpty) {
        _hasMoreProducts = false;
      } else {
        if (page == 1) {
          _products = newProducts;
        } else {
          _products.addAll(newProducts);
        }
        _currentPage = page;
        _filterProducts(); // Filter products according to the selected category
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filterProducts();
    } else {
      _filteredProducts = _products
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void filterByCategory(String category) {
    _selectedCategory = category;
    _filterProducts();
    notifyListeners();
  }

  void _filterProducts() {
    if (_selectedCategory == 'All') {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) => product.category == _selectedCategory)
          .toList();
    }
  }
}
