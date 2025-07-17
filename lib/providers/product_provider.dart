import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<int> _favoriteIds = [];
  bool _isLoading = false;
  String? _selectedCategory;

  List<Product> get products => _products;
  List<int> get favoriteIds => _favoriteIds;
  List<Product> get favorites =>
      _products.where((p) => _favoriteIds.contains(p.id)).toList();
  bool get isLoading => _isLoading;
  String? get selectedCategory => _selectedCategory;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      if (_selectedCategory == null || _selectedCategory == "All") {
        _products = await ApiService.fetchAllProducts();
      } else {
        _products = await ApiService.fetchProductsByCategory(_selectedCategory!);
      }
    } catch (e) {
      debugPrint('Error loading products: $e');
    }

    await _loadFavorites();
    _isLoading = false;
    notifyListeners();
  }

  void sortProducts(String type) {
    if (type == "Price: Low to High") {
      _products.sort((a, b) => a.price.compareTo(b.price));
    } else if (type == "Price: High to Low") {
      _products.sort((a, b) => b.price.compareTo(a.price));
    } else if (type == "Rating") {
      _products.sort((a, b) => b.rating.compareTo(a.rating));
    }
    notifyListeners();
  }

  void toggleFavorite(int id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'favorites',
      _favoriteIds.map((e) => e.toString()).toList(),
    );
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favorites') ?? [];
    _favoriteIds = saved.map(int.parse).toList();
    notifyListeners();
  }

  void setCategory(String? category) {
    _selectedCategory = category;
    loadProducts();
  }

  Future loadCategories() async {}
}
