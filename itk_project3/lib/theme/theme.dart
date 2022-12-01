import 'package:flutter/material.dart';

class CustomTheme {
  var theme = ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 87, 179, 143)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 87, 179, 143)),
      ),
    ),
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 87, 179, 143)),
  );
}
