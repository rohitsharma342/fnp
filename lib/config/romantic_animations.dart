import 'package:flutter/material.dart';

class RomanticAnimations {
  static const Duration gentle = Duration(milliseconds: 800);
  static const Duration soft = Duration(milliseconds: 600);
  static const Duration tender = Duration(milliseconds: 1200);
  
  static const Curve romantic = Curves.easeInOutCubic;
  static const Curve dreamy = Curves.easeOutQuart;
  static const Curve floating = Curves.elasticOut;
  
  // Heart beat animation
  static AnimationController createHeartBeat(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );
  }
  
  // Floating animation
  static Animation<double> createFloatingAnimation(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
  }
  
  // Fade in with scale
  static Animation<double> createFadeInScale(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: romantic,
    ));
  }
  
  // Shimmer effect
  static Animation<double> createShimmer(AnimationController controller) {
    return Tween<double>(
      begin: -2.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }
}