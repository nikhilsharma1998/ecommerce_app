import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task_app/models/product.dart';

class ProductService {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts({int page = 1, int limit = 10}) async {
    final response = await http.get(Uri.parse('$apiUrl?limit=$limit&page=$page'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProducts({
    int page = 1,
    int limit = 10,
    String searchQuery = '',
  }) async {
    final response = await http.get(Uri.parse('$apiUrl?limit=$limit&page=$page&search=$searchQuery'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Future<List<Product>> fetchProducts(int page) async {
  //   final response = await http.get(Uri.parse('$apiUrl?limit=10&page=$page'));
  //   if (response.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(response.body);
  //     return body.map((json) => Product.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  // }

  Future<List<Product>> searchProducts(String query) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$query'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search products');
    }
  }

  Future<List<Product>> filterProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$apiUrl/category/$category'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to filter products');
    }
  }
}
