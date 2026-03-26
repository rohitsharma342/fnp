import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../data/static_data.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favoriteIds = {};

  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);

  List<Product> get favorites {
    return StaticData.products
        .where((product) => _favoriteIds.contains(product.id))
        .toList();
  }

  int get count => _favoriteIds.length;

  bool isFavorite(String productId) {
    return _favoriteIds.contains(productId);
  }

  void toggleFavorite(String productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    notifyListeners();
  }

  void addToFavorites(String productId) {
    _favoriteIds.add(productId);
    notifyListeners();
  }

  void removeFromFavorites(String productId) {
    _favoriteIds.remove(productId);
    notifyListeners();
  }

  void clearFavorites() {
    _favoriteIds.clear();
    notifyListeners();
  }
}