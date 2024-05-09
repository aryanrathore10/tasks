import 'package:flutter/material.dart';
import 'package:tasks/src/shared/colors.dart';

final themelight = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colorPrimary,
        onPrimary: Colors.white,
        secondary: colorSecondary,
        onSecondary: Colors.white,
        error: Colors.red.shade400,
        onError: Colors.white,
        background: colorTertiory,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            minimumSize: Size.fromHeight(48),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        )));
