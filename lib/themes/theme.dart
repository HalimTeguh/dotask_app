import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFEEEEEE),
    surfaceContainer: Colors.white,
    primary: Color(0xFF5755FE),
    secondary: Color(0xFFFF71CD),
    inversePrimary: Color(0xFF8B93FF),
    tertiary: Color(0xFF2D3250),
    tertiaryContainer: Color(0xFF7077A1),
    error: Color(0xFFF875AA),
    errorContainer: Color(0xFFFFDFDF)
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF31363F),
    surfaceContainer: Color.fromARGB(255, 64, 69, 78),
    primary: Color(0xFF5755FE),
    secondary: Color(0xFFFF71CD),
    inversePrimary: Color(0xFF8B93FF),
  ),
);
