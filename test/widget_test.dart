import 'package:flutter/material.dart';
import 'package:rick_morty/pages/home_page.dart'; // Certifique-se de que está importando a HomePage corretamente

void main() {
  runApp(MyApp()); // Inicia a aplicação com o MyApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // HomePage será a tela inicial
    );
  }
}
