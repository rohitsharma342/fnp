import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../data/static_data.dart';

class ProductProvider extends ChangeNotifier {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  List<String> _selectedOccasions = [];
  double _minPrice = 0;
  double _maxPrice = 200;
  bool _showInStockOnly = false;
  String _sortBy = 'popularity';

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  List<String> get selectedOccasions => List.unmodifiable(_selectedOccasions);
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  bool get showInStockOnly => _showInStockOnly;
  String get sortBy => _sortBy;

  List<Product> get filteredProducts {
    List<Product> products = StaticData.products;

    if (_selectedCategory != 'All') {
      products = products.where((p) => p.category == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      products = products.where((p) {
        return p.name.toLowerCase().contains(query) ||
            p.description.toLowerCase().contains(query) ||
            p.category.toLowerCase().contains(query) ||
            p.occasions.any((o) => o.toLowerCase().contains(query));
      }).toList();
    }

    if (_selectedOccasions.isNotEmpty) {
      products = products.where((p) {
        return p.occasions.any((o) => _selectedOccasions.contains(o));
      }).toList();
    }

    products = products.where((p) {
      return p.price >= _minPrice && p.price <= _maxPrice;
    }).toList();

    if (_showInStockOnly) {
      products = products.where((p) => p.isInStock).toList();
    }

    switch (_sortBy) {
      case 'price_low':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'rating':
        products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'name':
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'popularity':
      default:
        products.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
        break;
    }

    return products;
  }

  List<Product> get trendingProducts => StaticData.getTrendingProducts();
  List<Product> get bestSellers => StaticData.getBestSellers();

  bool get hasActiveFilters {
    return _selectedOccasions.isNotEmpty ||
        _minPrice > 0 ||
        _maxPrice < 200 ||
        _showInStockOnly ||
        _sortBy != 'popularity';
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleOccasion(String occasion) {
    if (_selectedOccasions.contains(occasion)) {
      _selectedOccasions.remove(occasion);
    } else {
      _selectedOccasions.add(occasion);
    }
    notifyListeners();
  }

  void setPriceRange(double min, double max) {
    _minPrice = min;
    _maxPrice = max;
    notifyListeners();
  }

  void setShowInStockOnly(bool value) {
    _showInStockOnly = value;
    notifyListeners();
  }

  void setSortBy(String value) {
    _sortBy = value;
    notifyListeners();
  }

  void clearFilters() {
    _selectedOccasions = [];
    _minPrice = 0;
    _maxPrice = 200;
    _showInStockOnly = false;
    _sortBy = 'popularity';
    notifyListeners();
  }

  void resetAll() {
    _selectedCategory = 'All';
    _searchQuery = '';
    clearFilters();
  }
}