import 'package:flutter/material.dart';

final themeData = ThemeData(
  fontFamily: 'OpenSans',
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: Colors.deepPurple.shade700,
    foregroundColor: Colors.white,
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontFamily: 'OpenSans',
    ),
  ),
  useMaterial3: true,
);
