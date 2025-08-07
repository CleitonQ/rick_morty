import 'package:flutter/material.dart';

class DetailsPage1 extends StatelessWidget {
  final String image;
  final String text;

  const DetailsPage1({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Personagem'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(image),  // Exibe a imagem do personagem
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),  // Exibe o texto do personagem
          ],
        ),
      ),
    );
  }
}
