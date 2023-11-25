import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      tertiary: Color.fromRGBO(89, 89, 89, 1),
      surface: Colors.white,
      onSurface: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      secondary: Color.fromRGBO(55, 75, 88, 1),
      error: Colors.red,
      onError: Colors.white,
      onBackground: Colors.white,
      background: Colors.white,
      brightness: Brightness.light,
      primary: Color.fromRGBO(4, 113, 204, 1),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 22,
          color: Color.fromRGBO(55, 75, 88, 1),
          fontWeight: FontWeight.w600),
      displayMedium:
          TextStyle(fontSize: 18, color: Color.fromRGBO(55, 75, 88, 1)),
      displaySmall:
          TextStyle(fontSize: 16, color: Color.fromRGBO(55, 75, 88, 1)),
      headlineSmall:
          TextStyle(fontSize: 14, color: Color.fromRGBO(55, 75, 88, 1)),
      headlineMedium: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(55, 75, 88, 1),
          fontWeight: FontWeight.w600),
      bodySmall: TextStyle(
          fontSize: 17,
          color: Color.fromRGBO(55, 75, 88, 1),
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          fontSize: 24,
          color: Color.fromRGBO(55, 75, 88, 1),
          fontWeight: FontWeight.bold),
    ));
