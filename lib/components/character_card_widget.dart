import 'package:flutter/material.dart';

/// Widget que exibe um cartão de personagem com uma imagem e texto.
///
/// Este widget é usado para representar visualmente um personagem,
/// com a possibilidade de destacar o cartão quando selecionado.
class CharacterCardWidget extends StatelessWidget {
  final String image;  // URL da imagem do personagem
  final String text;   // Nome ou descrição do personagem
  final int id;        // ID do personagem
  final bool isSelected;  // Indica se o cartão está selecionado ou não

  // Construtor para o widget. O parâmetro isSelected tem um valor padrão de false.
  const CharacterCardWidget({
    super.key,
    required this.image,
    required this.text,
    required this.id,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6), // Espaço vertical entre os cartões
      width: double.infinity, // Largura do cartão ocupa toda a largura disponível
      height: 160, // Altura fixa do cartão
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Color(0xFF87A1FA), // Cor de fundo dependendo se está selecionado
        borderRadius: BorderRadius.circular(16), // Bordas arredondadas
      ),
      child: Column(
        children: [
          // Exibe a imagem do personagem com bordas arredondadas no topo
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              image,  // URL da imagem do personagem
              width: double.infinity, // Largura da imagem ocupa toda a largura do cartão
              height: 120, // Altura da imagem
              fit: BoxFit.cover, // Faz a imagem cobrir o espaço disponível sem distorção
            ),
          ),
          SizedBox(height: 10), // Espaçamento entre a imagem e o texto
          // Exibe o nome do personagem, alinhado à esquerda
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10), // Espaçamento à esquerda
              child: Text(
                text.toUpperCase(),  // Texto em maiúsculas
                style: TextStyle(
                  fontSize: 14.5, // Tamanho da fonte
                  color: isSelected ? Colors.black : Colors.white, // Cor do texto dependendo da seleção
                  fontWeight: FontWeight.w900, // Peso da fonte (negrito)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
