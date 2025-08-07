import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blueAccent,
    textTheme: TextTheme(
      bodyLarge: TextStyle(  // Atualizado de bodyText1 para bodyLarge
        fontFamily: 'Lato',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
