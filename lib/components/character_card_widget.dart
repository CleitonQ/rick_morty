import 'package:flutter/material.dart';

// Definição do widget CharacterCardWidget, que representa um card de personagem
class CharacterCardWidget extends StatelessWidget {
  final String image;  // URL da imagem do personagem
  final String text;   // Nome do personagem
  final int id;        // ID do personagem (não utilizado diretamente aqui, mas pode ser útil)
  final bool isSelected;  // Parâmetro para identificar se o card está selecionado (determina o estilo do card)

  // Construtor do widget, onde as propriedades do card são passadas como parâmetros
  const CharacterCardWidget({
    super.key,
    required this.image,   // Imagem do personagem
    required this.text,    // Nome do personagem
    required this.id,      // ID do personagem
    this.isSelected = false, // Por padrão, o card não estará selecionado
  });

  @override
  Widget build(BuildContext context) {
    // Retorna o layout do widget do card
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),  // Espaçamento vertical de 10 ao redor do card
      width: double.infinity,  // Card ocupa toda a largura disponível
      height: 160,             // Altura fixa de 160 para o card
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Color(0xFF87A1FA),  // Cor do card: azul quando selecionado, cor padrão caso contrário
        borderRadius: BorderRadius.circular(16),  // Bordas arredondadas de 16
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.transparent,  // Borda azul quando o card está selecionado
          width: 3,  // Largura da borda
        ),
      ),
      child: Column(
        children: [
          // Exibe a imagem do personagem no card com bordas arredondadas
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),   // Borda arredondada no canto superior esquerdo
              topRight: Radius.circular(16),  // Borda arredondada no canto superior direito
            ),
            child: Image.network(
              image,  // Carrega a imagem a partir da URL
              width: double.infinity,  // A imagem ocupa toda a largura do card
              height: 120,  // A altura da imagem é fixada em 120
              fit: BoxFit.cover,  // A imagem se ajusta para cobrir todo o espaço disponível sem distorcer
            ),
          ),
          SizedBox(height: 10),  // Espaçamento entre a imagem e o nome do personagem
          // Exibe o nome do personagem alinhado à esquerda
          Align(
            alignment: Alignment.centerLeft,  // Alinha o texto à esquerda
            child: Padding(
              padding: EdgeInsets.only(left: 10),  // Adiciona um padding de 10 à esquerda do texto
              child: Text(
                text,  // O nome do personagem que é passado como parâmetro
                style: TextStyle(
                  fontSize: 14.5,  // Tamanho da fonte
                  color: isSelected ? Colors.black : Colors.white,  // Cor do texto: preto se selecionado, branco caso contrário
                  fontWeight: FontWeight.w900,  // Peso da fonte, deixando o texto mais grosso
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
