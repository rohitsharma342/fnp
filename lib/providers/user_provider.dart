import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/address_model.dart';
import '../models/order_model.dart';
import '../data/static_data.dart';

class UserProvider extends ChangeNotifier {
  User _user = StaticData.currentUser;
  List<Order> _orders = StaticData.orders;
  bool _isLoggedIn = true;

  User get user => _user;
  List<Order> get orders => List.unmodifiable(_orders);
  bool get isLoggedIn => _isLoggedIn;

  void updateUser({
    String? name,
    String? email,
    String? phone,
    String? profileImage,
  }) {
    _user = _user.copyWith(
      name: name,
      email: email,
      phone: phone,
      profileImage: profileImage,
    );
    notifyListeners();
  }

  void addAddress(Address address) {
    final addresses = List<Address>.from(_user.addresses);
    if (address.isDefault) {
      for (int i = 0; i < addresses.length; i++) {
        addresses[i] = addresses[i].copyWith(isDefault: false);
      }
    }
    addresses.add(address);
    _user = _user.copyWith(addresses: addresses);
    notifyListeners();
  }

  void updateAddress(Address address) {
    final addresses = List<Address>.from(_user.addresses);
    final index = addresses.indexWhere((a) => a.id == address.id);
    if (index != -1) {
      if (address.isDefault) {
        for (int i = 0; i < addresses.length; i++) {
          addresses[i] = addresses[i].copyWith(isDefault: false);
        }
      }
      addresses[index] = address;
      _user = _user.copyWith(addresses: addresses);
      notifyListeners();
    }
  }

  void removeAddress(String addressId) {
    final addresses = _user.addresses.where((a) => a.id != addressId).toList();
    _user = _user.copyWith(addresses: addresses);
    notifyListeners();
  }

  void setDefaultAddress(String addressId) {
    final addresses = _user.addresses.map((a) {
      return a.copyWith(isDefault: a.id == addressId);
    }).toList();
    _user = _user.copyWith(addresses: addresses);
    notifyListeners();
  }

  Address? getDefaultAddress() {
    try {
      return _user.addresses.firstWhere((a) => a.isDefault);
    } catch (e) {
      return _user.addresses.isNotEmpty ? _user.addresses.first : null;
    }
  }

  void addOrder(Order order) {
    _orders = [order, ..._orders];
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void login() {
    _isLoggedIn = true;
    _user = StaticData.currentUser;
    _orders = StaticData.orders;
    notifyListeners();
  }
}