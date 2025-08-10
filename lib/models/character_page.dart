import 'package:flutter/material.dart';
import 'package:rick_morty/models/detailed_character.dart';  // Importando a classe DetailedCharacter que contém os detalhes do personagem.
import 'package:rick_morty/data/repository.dart'; // Para buscar os dados da API
import 'package:rick_morty/components/app_bar_widget.dart';  // Importando o AppBarWidget, que personaliza a barra de navegação

// Página que exibe os detalhes de um personagem específico.
class CharacterPage extends StatefulWidget {
  final int characterId;  // Recebe o ID do personagem selecionado

  // Construtor da classe que inicializa o ID do personagem
  const CharacterPage({super.key, required this.characterId});

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late Future<DetailedCharacter> _characterDetails;  // Declara o futuro que irá armazenar os detalhes do personagem

  @override
  void initState() {
    super.initState();
    // Ao inicializar, busca os detalhes do personagem usando o ID passado para a página
    _characterDetails = Repository.getCharacterDetails(widget.characterId);

    // Verificando se a função getFirstSeenIn está sendo chamada corretamente
    _characterDetails.then((character) {
      print('getFirstSeenIn foi chamado para o personagem: ${character.name}');
      character.getFirstSeenIn().then((_) {
        // Atualiza o estado com o valor de firstSeenIn após a requisição.
        setState(() {
          // A UI será atualizada após a requisição para o nome do episódio.
        });
      });
    }).catchError((error) {
      // Caso ocorra algum erro, exibe no log.
      print('Erro ao obter os detalhes do personagem: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isDetailPage: true),  // Usando o AppBarWidget com a seta de voltar
      body: FutureBuilder<DetailedCharacter>(  // Constrói a UI baseando-se nos detalhes do personagem (assíncrono)
        future: _characterDetails,  // Future que carrega os detalhes do personagem
        builder: (context, snapshot) {
          // Exibe um indicador de carregamento enquanto a requisição é processada
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Exibe erro se houver um problema na requisição
          if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar os detalhes."));
          }

          // Quando os dados estiverem disponíveis, exibe o conteúdo
          if (snapshot.hasData) {
            final character = snapshot.data!;  // Dados do personagem

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF87A1FA),  // Cor de fundo azul para o card
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),  // Bordas arredondadas no topo
                    topRight: Radius.circular(16), // Bordas arredondadas no topo
                    bottomLeft: Radius.circular(16), // Bordas arredondadas na parte inferior
                    bottomRight: Radius.circular(16), // Bordas arredondadas na parte inferior
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  // Alinha o conteúdo à esquerda dentro do card
                  children: [
                    // Exibindo a imagem do personagem com tamanho fixo (320x160)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),  // Sem bordas arredondadas na parte superior
                        topRight: Radius.circular(16), // Sem bordas arredondadas na parte superior
                      ),
                      child: Image.network(
                        character.image,
                        width: 320,  // Largura fixa de 320 pixels
                        height: 160,  // Altura fixa de 160 pixels
                        fit: BoxFit.cover,  // Faz a imagem cobrir completamente o espaço
                      ),
                    ),
                    SizedBox(height: 5),  // Espaço entre a imagem e o texto
                    // Nome do personagem, em letras maiúsculas
                    Text(
                      character.name.toUpperCase(),  // Nome do personagem transformado para maiúsculas
                      style: TextStyle(
                        color: Colors.white,  // Cor do texto
                        fontSize: 16,  // Tamanho da fonte
                        fontWeight: FontWeight.bold,  // Peso da fonte (negrito)
                      ),
                    ),
                    SizedBox(height: 10),  // Espaço entre o nome e as informações abaixo
                    // Exibindo informações detalhadas do personagem alinhadas à esquerda
                    Text("Espécie: ${character.species}",
                        style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    SizedBox(height: 8),
                    Text("Gênero: ${character.gender}",
                        style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    SizedBox(height: 8),
                    Text("Status: ${character.status}",
                        style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    SizedBox(height: 8),
                    Text("Origem: ${character.origin}",
                        style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    SizedBox(height: 8),
                    Text("Última Localização: ${character.location}",
                        style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    SizedBox(height: 8),
                    // Exibe o nome do episódio da primeira aparição do personagem
                    Text("Primeira Aparição: ${character.firstSeenIn.isEmpty ? 'Desconhecido' : character.firstSeenIn}",
                        style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                  ],
                ),
              ),
            );
          } else {
            // Caso não haja dados, exibe mensagem informando que não há dados
            return Center(child: Text("Sem dados disponíveis."));
          }
        },
      ),
    );
  }
}
