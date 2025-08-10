import 'package:flutter/material.dart';
import 'package:rick_morty/components/app_bar_widget.dart';
import 'package:rick_morty/components/character_card_widget.dart';
import 'package:rick_morty/models/character_page.dart';  // Corrigido o caminho da importação

// Dados locais dos personagens (com os 6 personagens restaurados)
final List<Map<String, String>> characterData = [
  {
    'image': 'https://rickandmortyapi.com/api/character/avatar/200.jpeg', // URL da imagem do personagem
    'text': 'LAWYER MORTY', // Nome ou descrição do personagem
    'id': '200', // ID único do personagem
  },
  {
    'image': 'https://rickandmortyapi.com/api/character/avatar/379.jpeg',
    'text': 'WEDDING BARTENDER',
    'id': '379',
  },
  {
    'image': 'https://rickandmortyapi.com/api/character/avatar/603.jpeg',
    'text': 'CROSSY',
    'id': '603',
  },
  {
    'image': 'https://rickandmortyapi.com/api/character/avatar/616.jpeg',
    'text': 'PHANTOM OF THE OPERA FAN',
    'id': '616',
  },
  {
    'image': 'https://rickandmortyapi.com/api/character/avatar/663.jpeg',
    'text': 'REGGIE',
    'id': '663',
  },
  {
    'image': 'https://rickandmortyapi.com/api/character/avatar/676.jpeg',
    'text': "JAPHETH'S MIDDLE SON",
    'id': '676',
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedIndex;  // Índice do card selecionado

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;  // Obtendo a largura da tela para ajustar o padding

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),  // Altura customizada da AppBar
        child: AppBarWidget(),  // Usando o widget customizado para a AppBar
      ),
      backgroundColor: Colors.black,  // Cor de fundo do aplicativo
      body: SingleChildScrollView(  // Permite rolagem da tela
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),  // Ajustando o padding horizontal
          child: Column(
            children: List.generate(characterData.length, (index) {
              var item = characterData[index];  // Obtendo os dados do personagem

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),  // Ajuste do espaçamento entre os cards
                child: GestureDetector(  // Detecta o toque no card
                  onTap: () {
                    setState(() {
                      selectedIndex = index;  // Atualiza o índice do card selecionado
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterPage(  // Navega para a página de detalhes do personagem
                            characterId: int.parse(item['id']!),  // Passando o ID do personagem como int
                          ),
                        )
                    );
                  },
                  child: CharacterCardWidget(  // Card do personagem
                    image: item['image']!,  // Passando a imagem do personagem
                    text: item['text']!,  // Passando o nome do personagem
                    id: int.parse(item['id']!),  // Passando o ID do personagem
                    isSelected: selectedIndex == index,  // Verifica se o card está selecionado
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
