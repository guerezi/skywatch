import 'package:flutter/material.dart';

class SkyColors {
  static MaterialColor primary = const MaterialColor(0xFFf6622d, <int, Color>{
    50: Color(0xFFFFF3E2),
    100: Color(0xFFFED7B9),
    200: Color(0xFFFEBA8F),
    300: Color(0xFFFE9C65),
    400: Color(0xFFFD803C),
    500: Color(0xFFf6622d),
    600: Color(0xFFD84E22),
    700: Color(0xFFB63A17),
    800: Color(0xFF94260D),
    900: Color(0xFF731203),
  });

  static MaterialColor secondary = const MaterialColor(0xFF1e2a40, {
    50: Color(0xFFAAB4C0),
    100: Color(0xFF8E9BAF),
    200: Color(0xFF73829D),
    300: Color(0xFF59698C),
    400: Color(0xFF3D506A),
    500: Color(0xFF1e2a40),
    600: Color(0xFF1A263A),
    700: Color(0xFF161F34),
    800: Color(0xFF121B2E),
    900: Color(0xFF0E1728),
  });

  static MaterialColor mono = const MaterialColor(0xFF8D959D, {
    0: Color(0xFFFFFFFF),
    50: Color(0xFFE9EDF0),
    100: Color(0xFFD3D9E0),
    200: Color(0xFFBDC6D0),
    300: Color(0xFFA7B2C0),
    400: Color(0xFF91A0B0),
    500: Color(0xFF8D959D),
    600: Color(0xFF6C7C8B),
    700: Color(0xFF566A7B),
    800: Color(0xFF405869),
    900: Color(0xFF2A4659),
    1000: Color(0xFF000000),
  });

  static ThemeData light = ThemeData(
    primaryColor: primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondary),
    textTheme: lightTextTheme,
    scaffoldBackgroundColor: mono[0]!,
  );

  static ThemeData dark = ThemeData(
    primaryColor: primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondary),
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: mono[1000]!,
  );

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: primary.shade500,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: mono[900]!,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: mono[900]!,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: mono[900]!,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: mono[900]!,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: mono[900]!,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: mono[900]!,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: mono[900]!,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: mono[900]!,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: mono[900]!,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: mono[900]!,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: primary.shade500,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: mono[0]!,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: mono[0]!,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: mono[0]!,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: mono[0]!,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: mono[0]!,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: mono[0]!,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: mono[0]!,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: mono[0]!,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: mono[0]!,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: mono[0]!,
    ),
  );
}
