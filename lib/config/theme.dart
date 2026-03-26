import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Primary green color palette - Enhanced green theme
  static const Color primaryColor = Color(0xFF38A169); // Vibrant green
  static const Color secondaryColor = Color(0xFF68D391); // Lighter green
  static const Color accentColor = Color(0xFFC6F6D5); // Very light green
  static const Color backgroundColor = Color(0xFFF0FFF4); // Warm white with green tint
  static const Color surfaceColor = Colors.white;
  static const Color textPrimary = Color(0xFF2D3748); // Dark gray
  static const Color textSecondary = Color(0xFF718096); // Medium gray
  static const Color successColor = Color(0xFF38A169); // Green
  static const Color errorColor = Color(0xFFE53E3E); // Red for errors
  static const Color warningColor = Color(0xFFD69E2E); // Amber
  static const Color darkGreen = Color(0xFF276749); // Dark green
  static const Color lightGreen = Color(0xFFF0FFF4); // Very light green background
  static const Color mediumGreen = Color(0xFF38A169); // Medium green
  
  // Enhanced green shades for variety
  static const Color greenShade50 = Color(0xFFF0FFF4);
  static const Color greenShade100 = Color(0xFFC6F6D5);
  static const Color greenShade200 = Color(0xFF9AE6B4);
  static const Color greenShade300 = Color(0xFF68D391);
  static const Color greenShade400 = Color(0xFF48BB78);
  static const Color greenShade500 = Color(0xFF38A169);
  static const Color greenShade600 = Color(0xFF2F855A);
  static const Color greenShade700 = Color(0xFF276749);
  static const Color greenShade800 = Color(0xFF22543D);
  static const Color greenShade900 = Color(0xFF1C4532);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textPrimary,
      onBackground: textPrimary,
      tertiary: accentColor,
      outline: darkGreen,
      primaryContainer: greenShade100,
      onPrimaryContainer: greenShade800,
      secondaryContainer: greenShade50,
      onSecondaryContainer: greenShade700,
    ),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'SF Pro Display', // iOS-style font
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceColor,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: true,
      shadowColor: primaryColor.withOpacity(0.1),
      titleTextStyle: const TextStyle(
        color: textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      iconTheme: const IconThemeData(
        color: darkGreen,
        size: 24,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 3,
        shadowColor: primaryColor.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
        ),
        minimumSize: const Size(0, 54),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkGreen,
        side: const BorderSide(color: darkGreen, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
        ),
        minimumSize: const Size(0, 54),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkGreen,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: greenShade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: greenShade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: greenShade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryColor, width: 2.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: errorColor, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: errorColor, width: 2.5),
      ),
      hintStyle: TextStyle(
        color: textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        color: darkGreen,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: 2,
      shadowColor: primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: greenShade100, width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 15,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        letterSpacing: -0.2,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        letterSpacing: -0.2,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: greenShade50,
      selectedColor: greenShade300,
      labelStyle: TextStyle(
        color: darkGreen,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      secondaryLabelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      side: BorderSide(color: greenShade300, width: 1.5),
      elevation: 1,
      pressElevation: 2,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 6,
      focusElevation: 8,
      hoverElevation: 8,
      highlightElevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.grey.shade400;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor.withOpacity(0.5);
        }
        return Colors.grey.shade300;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.transparent;
      }),
      checkColor: MaterialStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return textSecondary;
      }),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryColor,
      inactiveTrackColor: greenShade200,
      thumbColor: darkGreen,
      overlayColor: primaryColor.withOpacity(0.2),
      valueIndicatorColor: darkGreen,
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
      linearTrackColor: greenShade200,
      circularTrackColor: greenShade200,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: darkGreen,
      contentTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      actionTextColor: greenShade200,
    ),
    dividerTheme: DividerThemeData(
      color: greenShade200,
      thickness: 1,
      space: 1,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: darkGreen,
      textColor: textPrimary,
      tileColor: surfaceColor,
      selectedTileColor: greenShade50,
      selectedColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: primaryColor,
      unselectedLabelColor: textSecondary,
      indicatorColor: primaryColor,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: -0.3,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: -0.3,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primaryColor, width: 3.5),
        insets: const EdgeInsets.symmetric(horizontal: 20),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: surfaceColor,
      modalBackgroundColor: surfaceColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      elevation: 10,
      modalElevation: 20,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: surfaceColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      titleTextStyle: TextStyle(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      contentTextStyle: TextStyle(
        color: textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
    ),
    iconTheme: IconThemeData(
      color: darkGreen,
      size: 24,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: textPrimary,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.2,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        color: textPrimary,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.0,
        height: 1.3,
      ),
      displaySmall: TextStyle(
        color: textPrimary,
        fontSize: 26,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.8,
        height: 1.3,
      ),
      headlineLarge: TextStyle(
        color: textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.6,
        height: 1.3,
      ),
      headlineMedium: TextStyle(
        color: textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        height: 1.4,
      ),
      headlineSmall: TextStyle(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        height: 1.4,
      ),
      titleLarge: TextStyle(
        color: textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        height: 1.4,
      ),
      titleMedium: TextStyle(
        color: textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        color: textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        color: textPrimary,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.3,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: textPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        color: textSecondary,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.1,
        height: 1.4,
      ),
      labelLarge: TextStyle(
        color: darkGreen,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        color: darkGreen,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.1,
        height: 1.3,
      ),
      labelSmall: TextStyle(
        color: textSecondary,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.0,
        height: 1.3,
      ),
    ),
  );

  // Enhanced dark theme with green accents
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: greenShade400,
      secondary: greenShade300,
      surface: const Color(0xFF1A1A1A),
      background: const Color(0xFF0F0F0F),
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      tertiary: greenShade900,
      outline: greenShade300,
      primaryContainer: greenShade800,
      onPrimaryContainer: greenShade100,
      secondaryContainer: greenShade900,
      onSecondaryContainer: greenShade200,
    ),
    scaffoldBackgroundColor: const Color(0xFF0F0F0F),
    fontFamily: 'SF Pro Display',
  );

  // Enhanced utility methods for green color variations
  static Color getGreenShade(int shade) {
    switch (shade) {
      case 50: return greenShade50;
      case 100: return greenShade100;
      case 200: return greenShade200;
      case 300: return greenShade300;
      case 400: return greenShade400;
      case 500: return greenShade500;
      case 600: return greenShade600;
      case 700: return greenShade700;
      case 800: return greenShade800;
      case 900: return greenShade900;
      default: return primaryColor;
    }
  }

  static Color getGreenWithOpacity(double opacity) {
    return primaryColor.withOpacity(opacity);
  }

  static LinearGradient getGreenGradient() {
    return LinearGradient(
      colors: [greenShade400, greenShade600],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient getLightGreenGradient() {
    return LinearGradient(
      colors: [greenShade50, greenShade100],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient getVibrantGreenGradient() {
    return LinearGradient(
      colors: [greenShade500, greenShade700],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static LinearGradient getSubtleGreenGradient() {
    return LinearGradient(
      colors: [greenShade100, greenShade200],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static BoxShadow getGreenShadow({double opacity = 0.15, double blurRadius = 8}) {
    return BoxShadow(
      color: primaryColor.withOpacity(opacity),
      blurRadius: blurRadius,
      offset: const Offset(0, 4),
    );
  }

  static BoxShadow getElevatedGreenShadow() {
    return BoxShadow(
      color: primaryColor.withOpacity(0.25),
      blurRadius: 12,
      offset: const Offset(0, 6),
    );
  }

  // Legacy red methods for backward compatibility
  static Color getRedShade(int shade) {
    return getGreenShade(shade);
  }

  static Color getRedWithOpacity(double opacity) {
    return getGreenWithOpacity(opacity);
  }

  static LinearGradient getRedGradient() {
    return getGreenGradient();
  }

  static LinearGradient getLightRedGradient() {
    return getLightGreenGradient();
  }

  static LinearGradient getVibrantRedGradient() {
    return getVibrantGreenGradient();
  }

  static LinearGradient getSubtleRedGradient() {
    return getSubtleGreenGradient();
  }

  static BoxShadow getRedShadow({double opacity = 0.15, double blurRadius = 8}) {
    return getGreenShadow(opacity: opacity, blurRadius: blurRadius);
  }

  static BoxShadow getElevatedRedShadow() {
    return getElevatedGreenShadow();
  }

  // Legacy red color constants for backward compatibility
  static const Color redShade50 = greenShade50;
  static const Color redShade100 = greenShade100;
  static const Color redShade200 = greenShade200;
  static const Color redShade300 = greenShade300;
  static const Color redShade400 = greenShade400;
  static const Color redShade500 = greenShade500;
  static const Color redShade600 = greenShade600;
  static const Color redShade700 = greenShade700;
  static const Color redShade800 = greenShade800;
  static const Color redShade900 = greenShade900;
  static const Color darkRed = darkGreen;
  static const Color lightRed = lightGreen;
  static const Color mediumRed = mediumGreen;
}