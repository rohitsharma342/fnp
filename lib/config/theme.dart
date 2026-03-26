import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Primary red color palette - Enhanced red theme
  static const Color primaryColor = Color(0xFFE53E3E); // Vibrant red
  static const Color secondaryColor = Color(0xFFFC8181); // Lighter red
  static const Color accentColor = Color(0xFFFED7D7); // Very light red
  static const Color backgroundColor = Color(0xFFFFFAFA); // Warm white
  static const Color surfaceColor = Colors.white;
  static const Color textPrimary = Color(0xFF2D3748); // Dark gray
  static const Color textSecondary = Color(0xFF718096); // Medium gray
  static const Color successColor = Color(0xFF38A169); // Green
  static const Color errorColor = Color(0xFFE53E3E); // Red for errors
  static const Color warningColor = Color(0xFFD69E2E); // Amber
  static const Color darkRed = Color(0xFF9B2C2C); // Dark red
  static const Color lightRed = Color(0xFFFFF5F5); // Very light red background
  static const Color mediumRed = Color(0xFFE53E3E); // Medium red
  
  // Enhanced red shades for variety
  static const Color redShade50 = Color(0xFFFFF5F5);
  static const Color redShade100 = Color(0xFFFED7D7);
  static const Color redShade200 = Color(0xFFFEB2B2);
  static const Color redShade300 = Color(0xFFFC8181);
  static const Color redShade400 = Color(0xFFF56565);
  static const Color redShade500 = Color(0xFFE53E3E);
  static const Color redShade600 = Color(0xFFC53030);
  static const Color redShade700 = Color(0xFF9B2C2C);
  static const Color redShade800 = Color(0xFF822727);
  static const Color redShade900 = Color(0xFF63171B);

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
      shadowColor: primaryColor.withOpacity(0.1),
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
        foregroundColor: darkRed,
        side: const BorderSide(color: darkRed, width: 2),
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
        foregroundColor: darkRed,
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
      fillColor: redShade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: redShade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: redShade200),
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
        color: darkRed,
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
        side: BorderSide(color: redShade100, width: 1),
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
      backgroundColor: redShade50,
      selectedColor: redShade300,
      labelStyle: TextStyle(
        color: darkRed,
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
      side: BorderSide(color: redShade300, width: 1.5),
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
      inactiveTrackColor: redShade200,
      thumbColor: darkRed,
      overlayColor: primaryColor.withOpacity(0.2),
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
        borderRadius: BorderRadius.circular(14),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      actionTextColor: redShade200,
    ),
    dividerTheme: DividerThemeData(
      color: redShade200,
      thickness: 1,
      space: 1,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: darkRed,
      textColor: textPrimary,
      tileColor: surfaceColor,
      selectedTileColor: redShade50,
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
        color: darkRed,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        color: darkRed,
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

  // Enhanced dark theme with red accents
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: redShade400,
      secondary: redShade300,
      surface: const Color(0xFF1A1A1A),
      background: const Color(0xFF0F0F0F),
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
    scaffoldBackgroundColor: const Color(0xFF0F0F0F),
    fontFamily: 'SF Pro Display',
  );

  // Enhanced utility methods for red color variations
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

  static LinearGradient getVibrantRedGradient() {
    return LinearGradient(
      colors: [redShade500, redShade700],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static LinearGradient getSubtleRedGradient() {
    return LinearGradient(
      colors: [redShade100, redShade200],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static BoxShadow getRedShadow({double opacity = 0.15, double blurRadius = 8}) {
    return BoxShadow(
      color: primaryColor.withOpacity(opacity),
      blurRadius: blurRadius,
      offset: const Offset(0, 4),
    );
  }

  static BoxShadow getElevatedRedShadow() {
    return BoxShadow(
      color: primaryColor.withOpacity(0.25),
      blurRadius: 12,
      offset: const Offset(0, 6),
    );
  }
}