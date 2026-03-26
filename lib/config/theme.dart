import 'package:flutter/material.dart';

class AppTheme {
  // Primary red color palette
  static const Color primaryColor = Color(0xFFDC2626); // Modern red
  static const Color secondaryColor = Color(0xFFEF4444); // Lighter red
  static const Color accentColor = Color(0xFFFEE2E2); // Very light red
  static const Color backgroundColor = Color(0xFFFEFEFE); // Clean white
  static const Color surfaceColor = Colors.white;
  static const Color textPrimary = Color(0xFF1F2937); // Dark gray
  static const Color textSecondary = Color(0xFF6B7280); // Medium gray
  static const Color successColor = Color(0xFF10B981); // Green
  static const Color errorColor = Color(0xFFDC2626); // Red for errors
  static const Color warningColor = Color(0xFFF59E0B); // Amber
  static const Color darkRed = Color(0xFF991B1B); // Dark red
  static const Color lightRed = Color(0xFFFEF2F2); // Very light red background
  static const Color mediumRed = Color(0xFFEF4444); // Medium red
  
  // Additional red shades for variety
  static const Color redShade50 = Color(0xFFFEF2F2);
  static const Color redShade100 = Color(0xFFFEE2E2);
  static const Color redShade200 = Color(0xFFFECACA);
  static const Color redShade300 = Color(0xFFFCA5A5);
  static const Color redShade400 = Color(0xFFF87171);
  static const Color redShade500 = Color(0xFFEF4444);
  static const Color redShade600 = Color(0xFFDC2626);
  static const Color redShade700 = Color(0xFFB91C1C);
  static const Color redShade800 = Color(0xFF991B1B);
  static const Color redShade900 = Color(0xFF7F1D1D);

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
      outline: darkRed,
      primaryContainer: redShade100,
      onPrimaryContainer: redShade800,
      secondaryContainer: redShade50,
      onSecondaryContainer: redShade700,
    ),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'SF Pro Display', // iOS-style font
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceColor,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: true,
      shadowColor: primaryColor.withOpacity(0.08),
      titleTextStyle: const TextStyle(
        color: textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      iconTheme: const IconThemeData(
        color: darkRed,
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
        elevation: 2,
        shadowColor: primaryColor.withOpacity(0.25),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
        ),
        minimumSize: const Size(0, 52),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkRed,
        side: const BorderSide(color: darkRed, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
        ),
        minimumSize: const Size(0, 52),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkRed,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
      fillColor: redShade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: redShade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: redShade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: errorColor, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: errorColor, width: 2),
      ),
      hintStyle: TextStyle(
        color: textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        color: darkRed,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: 1,
      shadowColor: primaryColor.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: redShade100, width: 0.5),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: textSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 12,
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
      backgroundColor: redShade50,
      selectedColor: redShade200,
      labelStyle: TextStyle(
        color: darkRed,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      secondaryLabelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      side: BorderSide(color: redShade300, width: 1),
      elevation: 0,
      pressElevation: 1,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 4,
      focusElevation: 6,
      hoverElevation: 6,
      highlightElevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
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
        borderRadius: BorderRadius.circular(4),
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
      inactiveTrackColor: redShade200,
      thumbColor: darkRed,
      overlayColor: primaryColor.withOpacity(0.15),
      valueIndicatorColor: darkRed,
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
      linearTrackColor: redShade200,
      circularTrackColor: redShade200,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: darkRed,
      contentTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 4,
      actionTextColor: redShade200,
    ),
    dividerTheme: DividerThemeData(
      color: redShade200,
      thickness: 0.8,
      space: 1,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: darkRed,
      textColor: textPrimary,
      tileColor: surfaceColor,
      selectedTileColor: redShade50,
      selectedColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    ),
    tabBarTheme: TabBarTheme(
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
        borderSide: BorderSide(color: primaryColor, width: 3),
        insets: const EdgeInsets.symmetric(horizontal: 20),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: surfaceColor,
      modalBackgroundColor: surfaceColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      elevation: 8,
      modalElevation: 16,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: surfaceColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
      color: darkRed,
      size: 24,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        color: textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.8,
        height: 1.3,
      ),
      displaySmall: TextStyle(
        color: textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.6,
        height: 1.3,
      ),
      headlineLarge: TextStyle(
        color: textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        height: 1.3,
      ),
      headlineMedium: TextStyle(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        height: 1.4,
      ),
      headlineSmall: TextStyle(
        color: textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        height: 1.4,
      ),
      titleLarge: TextStyle(
        color: textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        height: 1.4,
      ),
      titleMedium: TextStyle(
        color: textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        color: textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        color: textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.1,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        color: textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.4,
      ),
      labelLarge: TextStyle(
        color: darkRed,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.1,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        color: darkRed,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.0,
        height: 1.3,
      ),
      labelSmall: TextStyle(
        color: textSecondary,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.3,
      ),
    ),
  );

  // Dark theme with red accents
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: redShade400,
      secondary: redShade300,
      surface: const Color(0xFF1F1F1F),
      background: const Color(0xFF121212),
      error: redShade400,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      tertiary: redShade900,
      outline: redShade300,
      primaryContainer: redShade800,
      onPrimaryContainer: redShade100,
      secondaryContainer: redShade900,
      onSecondaryContainer: redShade200,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    fontFamily: 'SF Pro Display',
  );

  // Utility methods for red color variations
  static Color getRedShade(int shade) {
    switch (shade) {
      case 50: return redShade50;
      case 100: return redShade100;
      case 200: return redShade200;
      case 300: return redShade300;
      case 400: return redShade400;
      case 500: return redShade500;
      case 600: return redShade600;
      case 700: return redShade700;
      case 800: return redShade800;
      case 900: return redShade900;
      default: return primaryColor;
    }
  }

  static Color getRedWithOpacity(double opacity) {
    return primaryColor.withOpacity(opacity);
  }

  static LinearGradient getRedGradient() {
    return LinearGradient(
      colors: [redShade400, redShade600],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient getLightRedGradient() {
    return LinearGradient(
      colors: [redShade50, redShade100],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}