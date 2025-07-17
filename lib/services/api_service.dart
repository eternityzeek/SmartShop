import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../constants.dart';

class ApiService {
  static Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(Uri.parse('$kApiBaseUrl/products'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$kApiBaseUrl/products/categories'));
    if (response.statusCode == 200) {
      final List categories = json.decode(response.body);
      return categories.cast<String>();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<Product>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$kApiBaseUrl/products/category/$category'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load category products');
    }
  }
}
