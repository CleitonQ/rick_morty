import 'package:dio/dio.dart';  // Pacote para realizar requisições HTTP

/// A classe `DetailedCharacter` representa os dados detalhados de um personagem.
///
/// Contém informações como nome, espécie, gênero, status, origem, localização,
/// imagem e episódios em que o personagem aparece. Além disso, possui um método
/// para buscar o nome do primeiro episódio em que o personagem apareceu.
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

  /// Construtor da classe `DetailedCharacter` que inicializa os campos da instância.
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

  /// Método para converter os dados de JSON em uma instância de `DetailedCharacter`.
  ///
  /// Este método é chamado quando recebemos dados da API para construir um
  /// objeto `DetailedCharacter` a partir do JSON retornado.
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

  /// Método assíncrono para buscar o nome do primeiro episódio em que o personagem apareceu.
  ///
  /// Este método faz uma requisição HTTP usando a URL do primeiro episódio na lista
  /// e busca o nome do episódio na resposta. Caso ocorra um erro, ou não haja episódios,
  /// ele atribui uma mensagem de erro à variável `firstSeenIn`.
  Future<void> getFirstSeenIn() async {
    // Verifica se a lista de episódios não está vazia
    if (episodeUrls.isNotEmpty) {
      String episodeUrl = episodeUrls[0];  // Pega o primeiro episódio da lista de episódios

      try {
        // Realiza a requisição HTTP para obter os dados do episódio
        Response response = await Dio().get(episodeUrl);

        // Verifica se a chave 'name' existe na resposta da API
        if (response.data['name'] != null) {
          this.firstSeenIn = response.data['name'];  // Atribui o nome do episódio à variável firstSeenIn
        } else {
          this.firstSeenIn = 'Nome do episódio não encontrado';  // Tratamento de erro
        }
      } catch (e) {
        // Caso ocorra algum erro na requisição, trata o erro e exibe uma mensagem
        print('Erro ao buscar o episódio: $e');
        this.firstSeenIn = 'Erro ao buscar o episódio';  // Tratamento de erro
      }
    } else {
      // Caso não haja episódios na lista, exibe uma mensagem de erro
      print('Episódio não encontrado');
      this.firstSeenIn = 'Episódio não encontrado';  // Tratamento de erro
    }
  }
}
