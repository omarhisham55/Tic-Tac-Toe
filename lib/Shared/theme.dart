import 'package:flutter/material.dart';

import 'constants.dart';

class GameTheme {
  static ThemeData gameTheme = ThemeData(
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        displayLarge:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: Colors.deepPurple),
        displaySmall: TextStyle(color: Colors.deepPurple),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
      ),
      dialogBackgroundColor: const Color.fromARGB(255, 53, 53, 53));
}
