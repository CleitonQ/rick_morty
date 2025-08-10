import 'package:dio/dio.dart';  // Pacote para realizar requisições HTTP

// A classe DetailedCharacter representa os dados detalhados de um personagem.
class DetailedCharacter {
  final String name;  // Nome do personagem
  final String species;  // Espécie do personagem
  final String gender;  // Gênero do personagem
  final String status;  // Status do personagem (ex: vivo, morto, etc.)
  final String origin;  // Origem do personagem (ex: planeta, dimensão, etc.)
  final String location;  // Localização atual do personagem
  final String image;  // URL da imagem do personagem
  final List<String> episodeUrls;  // Lista de URLs dos episódios em que o personagem aparece
  String firstSeenIn = ''; // Variável para armazenar o nome do episódio da primeira aparição, inicializada como string vazia

  // Construtor da classe DetailedCharacter que inicializa os campos da instância.
  DetailedCharacter({
    required this.name,
    required this.species,
    required this.gender,
    required this.status,
    required this.origin,
    required this.location,
    required this.image,
    required this.episodeUrls,
  });

  // Método para converter os dados de JSON em uma instância de DetailedCharacter.
  // Este método é chamado quando recebemos dados da API.
  factory DetailedCharacter.fromJson(Map<String, dynamic> json) {
    // Converte a lista de episódios da API em uma lista de strings
    List<String> episodeUrls = List<String>.from(json['episode']);
    return DetailedCharacter(
      name: json['name'],
      species: json['species'],
      gender: json['gender'],
      status: json['status'],
      origin: json['origin']['name'],  // A origem é um objeto, por isso acessamos o nome
      location: json['location']['name'],  // A localização é um objeto, por isso acessamos o nome
      image: json['image'],
      episodeUrls: episodeUrls,  // Lista de URLs dos episódios
    );
  }

  // Método para buscar o nome do episódio onde o personagem teve sua primeira aparição.
  Future<void> getFirstSeenIn() async {
    if (episodeUrls.isNotEmpty) {
      String episodeUrl = episodeUrls[0];  // Pega o primeiro episódio da lista de episódios
      print('Requisitando episódio na URL: $episodeUrl');  // Exibe no log a URL do episódio

      try {
        // Realiza a requisição HTTP para obter os dados do episódio
        Response response = await Dio().get(episodeUrl);

        // Log detalhado da resposta da API para verificar o conteúdo retornado
        print('Resposta do episódio: ${response.data}');

        // Verifica se a chave 'name' existe na resposta da API
        if (response.data['name'] != null) {
          this.firstSeenIn = response.data['name'];  // Atribui o nome do episódio à variável firstSeenIn
          print('Primeira aparição: $firstSeenIn');  // Exibe o nome do episódio no log
        } else {
          // Caso o nome não esteja presente, atribui um valor de erro
          print('Erro: Nome do episódio não encontrado.');
          this.firstSeenIn = 'Nome do episódio não encontrado';  // Tratamento de erro para quando o nome não for encontrado
        }
      } catch (e) {
        // Caso ocorra algum erro na requisição, trata o erro e exibe uma mensagem
        print('Erro ao buscar o episódio: $e');
        this.firstSeenIn = 'Erro ao buscar o episódio';  // Tratamento de erro para falhas na requisição
      }
    } else {
      // Caso a lista de episódios esteja vazia, trata o erro
      print('Erro: Lista de episódios vazia.');
      this.firstSeenIn = 'Episódio não encontrado';  // Tratamento de erro quando a lista de episódios estiver vazia
    }
  }
}
