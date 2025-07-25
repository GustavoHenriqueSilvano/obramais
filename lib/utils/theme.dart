import 'package:flutter/material.dart';
import 'package:obramais/utils/app_colors.dart';

// local para definição do tema geral, será configurado posteriormente.

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: CoresApp
      .backgroundPrimario, // formato para chamar as cores d app_colors.dart
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF6200EE),
    primary: Color(0xFF6200EE),
    secondary: Color(0xFF03DAC6),
    surface: Colors.white,
    error: Color(0xFFB00020),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Color(0xFFF5F5F5),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF6200EE),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF03DAC6),
    foregroundColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF6200EE),
      foregroundColor: Colors.white,
    ),
  ),
  textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Montserrat'),
);
