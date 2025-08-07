import 'package:flutter/material.dart';
import 'package:rick_morty/components/app_bar_widget.dart';  // Importação correta do AppBarWidget
import 'package:rick_morty/components/character_card_widget.dart'; // Importando o Card Widget
import 'package:rick_morty/data/character_data.dart';  // Dados dos personagens

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Adicionando o parâmetro `key`

  @override
  Widget build(BuildContext context) {
    // Usando MediaQuery para saber o tamanho da tela
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Tamanho customizado da AppBar
        child: AppBarWidget(), // Usando o AppBar customizado
      ),
      backgroundColor: Colors.black, // Definindo o fundo da tela para preto
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),  // Ajustando o padding com base no tamanho da tela
          child: Column(
            children: List.generate(characterData.length, (index) {
              var item = characterData[index]; // Dados do personagem
              return Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.02),  // Ajustando o espaçamento entre os cards
                child: CharacterCardWidget(
                  image: item['image']!, // Passando a imagem do personagem
                  text: item['text']!, // Passando o nome do personagem
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
