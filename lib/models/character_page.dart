import 'package:flutter/material.dart';
import 'package:rick_morty/models/detailed_character.dart'; // Importando a classe DetailedCharacter
import 'package:rick_morty/data/repository.dart'; // Para buscar os dados da API
import 'package:rick_morty/components/app_bar_widget.dart';  // Importando o AppBarWidget

class CharacterPage extends StatefulWidget {
  final int characterId;  // Recebe o ID do personagem

  const CharacterPage({super.key, required this.characterId});

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late Future<DetailedCharacter> _characterDetails;  // Variável para armazenar os detalhes do personagem

  @override
  void initState() {
    super.initState();
    // Ao inicializar, busca os detalhes do personagem usando o ID passado para a página
    _characterDetails = Repository.getCharacterDetails(widget.characterId);

    // Verificando se a função getFirstSeenIn está sendo chamada corretamente
    _characterDetails.then((character) {
      print('Personagem: ${character.name}');
      character.getFirstSeenIn().then((_) {
        // Atualiza o estado com o valor de firstSeenIn após a requisição.
        setState(() {});
      });
    }).catchError((error) {
      // Caso ocorra algum erro, exibe no log.
      print('Erro ao obter os detalhes do personagem: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isDetailPage: true),  // Exibe o AppBar customizado
      backgroundColor: Colors.black,  // Cor de fundo da página
      body: FutureBuilder<DetailedCharacter>(
        future: _characterDetails,  // Espera a conclusão da requisição para exibir os dados
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());  // Exibe um indicador de carregamento enquanto os dados estão sendo buscados
          }

          if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar os detalhes."));  // Exibe uma mensagem caso haja erro
          }

          if (snapshot.hasData) {
            final character = snapshot.data!;  // Obtém os dados do personagem

            // Lógica para determinar a cor da bolinha de status
            Color statusColor;
            switch (character.status.toLowerCase()) {
              case 'alive':
                statusColor = Colors.green;
                break;
              case 'dead':
                statusColor = Colors.red;
                break;
              case 'unknown':
                statusColor = Colors.grey;
                break;
              default:
                statusColor = Colors.black;
            }

            // Retorna a interface de detalhes do personagem
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(  // Permite rolagem se o conteúdo for maior que a tela
                child: Center(  // Centraliza o card
                  child: Container(
                    width: 350,  // Limita a largura do card
                    decoration: BoxDecoration(
                      color: Color(0xFF87A1FA),  // Cor de fundo do container
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),  // Borda arredondada inferior esquerda
                        bottomRight: Radius.circular(16),  // Borda arredondada inferior direita
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Exibe a imagem do personagem
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),  // Borda arredondada superior esquerda
                            topRight: Radius.circular(16),  // Borda arredondada superior direita
                            bottomLeft: Radius.circular(16),  // Borda arredondada inferior esquerda
                            bottomRight: Radius.circular(16),  // Borda arredondada inferior direita
                          ),
                          child: Image.network(
                            character.image,
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Exibe o nome do personagem em caixa alta
                              Text(
                                character.name.toUpperCase(),  // Tratamento caso o nome seja null
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 44),
                              Row(
                                children: [
                                  // Exibe o círculo de status do personagem
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: statusColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,  // Borda branca
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  // Exibe o status e a espécie do personagem
                                  Text(
                                    "${character.status} - ${character.species}",  // Tratamento de null
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              // Exibe a localização do personagem
                              Text(
                                "Last know location:",
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w100,  // Título mais fino
                                  color: Color.fromARGB(100, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "${character.location.isEmpty ? 'Desconhecido' : character.location}",  // Tratamento de location null
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15),
                              // Exibe o nome do primeiro episódio
                              Text(
                                "First seen in:",
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(100, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                character.firstSeenIn.isEmpty ? 'Desconhecido' : character.firstSeenIn,
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 15),
                              // Exibe o gênero do personagem
                              Text(
                                "Gender:",
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(100, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "${character.gender}",  // Tratamento de null
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 15),
                              // Exibe a origem do personagem
                              Text(
                                "Origin:",
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(100, 255, 255, 255),
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "${character.origin}",  // Tratamento de null
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 30),  // Adiciona o espaço no final para distanciar do limite inferior
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text("Sem dados disponíveis."));  // Exibe mensagem caso não haja dados
          }
        },
      ),
    );
  }
}
