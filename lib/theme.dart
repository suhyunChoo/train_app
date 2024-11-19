import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.grey[200],
  primaryColor: Colors.white,
  highlightColor: Colors.purple,
  dividerColor: Colors.black38,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: MaterialStatePropertyAll(Colors.purple),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ),
  ),
);
final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.dark,
  ),
  primaryColor: Colors.grey[800],
  highlightColor: Colors.purple,
  dividerColor: Colors.white30,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: MaterialStatePropertyAll(Colors.purple),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ),
  ),
);