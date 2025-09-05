import 'package:flutter/material.dart';
import 'package:rick_morty/pages/home_page.dart';
import 'package:rick_morty/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CleitonQ - Kode Start 2025',
      theme: AppTheme.lightTheme,
      home: HomePage(),
    );
  }
}
