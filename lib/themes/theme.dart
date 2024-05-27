import 'package:flutter/material.dart';

// Teriary for Text
// Teriary Container for Container the Container

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFEEEEEE),
    surfaceContainer: Colors.white,
    primary: Color(0xFF5755FE),
    secondary: Color(0xFFFF71CD),
    inversePrimary: Color(0xFF8B93FF),
    tertiary: Color(0xFF2D3250),
    onTertiary: Color(0xFFEEEEEE),
    tertiaryContainer: Color(0xFF7077A1),
    error: Color(0xFFF875AA),
    errorContainer: Color(0xFFFFDFDF),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF31363F),
    surfaceContainer: Color.fromARGB(255, 64, 69, 78),
    primary: Color(0xFF5755FE),
    secondary: Color(0xFFFF71CD),
    tertiary: Color(0xFFEEEEEE),
    onTertiary: Color(0xFFEEEEEE),
    tertiaryContainer: Color(0xFF7077A1),
    inversePrimary: Color(0xFF8B93FF),
    error: Color(0xFFFFDFDF),
    errorContainer: Color(0xFFF875AA),
  ),
);
