import 'package:flutter/material.dart';

class RomanticColors {
  // Romantic color palette
  static const Color roseGold = Color(0xFFE8B4B8);
  static const Color blushPink = Color(0xFFF8E8E9);
  static const Color softPeach = Color(0xFFFFE5E5);
  static const Color warmCream = Color(0xFFFFF8F0);
  static const Color dustyRose = Color(0xFFD4A5A5);
  static const Color champagne = Color(0xFFF7E7CE);
  static const Color lavenderMist = Color(0xFFE6E6FA);
  static const Color softCoral = Color(0xFFFF9999);
  static const Color pinkGlow = Color(0xFFFFB6C1);
  static const Color romanticRed = Color(0xFFDC143C);
  
  // Gradient combinations
  static LinearGradient get romanticGradient => LinearGradient(
    colors: [roseGold.withOpacity(0.3), blushPink.withOpacity(0.5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static LinearGradient get sunsetGradient => LinearGradient(
    colors: [softPeach, champagne],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static LinearGradient get dreamyGradient => LinearGradient(
    colors: [lavenderMist.withOpacity(0.4), warmCream],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static LinearGradient get heartGradient => LinearGradient(
    colors: [pinkGlow, softCoral],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}