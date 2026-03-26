import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/order_confirmation_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/add_address_screen.dart';
import '../screens/order_details_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/notifications_screen.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';
import '../models/address_model.dart';

class AppRoutes {
  static const String splash = '/';
  static const String dashboard = '/dashboard';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String checkout = '/checkout';
  static const String orderConfirmation = '/order-confirmation';
  static const String editProfile = '/edit-profile';
  static const String addAddress = '/add-address';
  static const String orderDetails = '/order-details';
  static const String favorites = '/favorites';
  static const String notifications = '/notifications';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildPageRoute(const SplashScreen(), settings);
      case dashboard:
        return _buildPageRoute(const DashboardScreen(), settings);
      case productDetails:
        final product = settings.arguments as Product;
        return _buildPageRoute(ProductDetailsScreen(product: product), settings);
      case cart:
        return _buildPageRoute(const CartScreen(), settings);
      case profile:
        return _buildPageRoute(const ProfileScreen(), settings);
      case checkout:
        return _buildPageRoute(const CheckoutScreen(), settings);
      case orderConfirmation:
        final orderId = settings.arguments as String;
        return _buildPageRoute(OrderConfirmationScreen(orderId: orderId), settings);
      case editProfile:
        return _buildPageRoute(const EditProfileScreen(), settings);
      case addAddress:
        final address = settings.arguments as Address?;
        return _buildPageRoute(AddAddressScreen(address: address), settings);
      case orderDetails:
        final order = settings.arguments as Order;
        return _buildPageRoute(OrderDetailsScreen(order: order), settings);
      case favorites:
        return _buildPageRoute(const FavoritesScreen(), settings);
      case notifications:
        return _buildPageRoute(const NotificationsScreen(), settings);
      default:
        return _buildPageRoute(const SplashScreen(), settings);
    }
  }

  static PageRouteBuilder _buildPageRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}