import 'package:dio/dio.dart';
import 'package:rick_morty/models/detailed_character.dart'; // Importando a classe DetailedCharacter

/// Classe abstrata `Repository` que gerencia a comunicação com a API.
///
/// A `Repository` é responsável por fazer as requisições HTTP para obter os dados
/// dos personagens e seus detalhes a partir da API do Rick and Morty.
abstract class Repository {
  // Instância do Dio configurada com a URL base da API.
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://rickandmortyapi.com/api/",  // Base URL da API
  ));

  /// Método para obter os detalhes de um personagem pela sua ID.
  ///
  /// Este método faz uma requisição GET para buscar os detalhes completos de um personagem.
  /// Ao receber a resposta, ele converte os dados JSON em uma instância de `DetailedCharacter`.
  ///
  /// [characterId] ID do personagem que se deseja buscar os detalhes.
  /// Retorna uma instância de `DetailedCharacter` com as informações do personagem.
  /// Lança um erro se ocorrer falha na requisição.
  static Future<DetailedCharacter> getCharacterDetails(int characterId) async {
    try {
      final response = await _dio.get('character/$characterId');

      // Converte a resposta JSON em um objeto DetailedCharacter e o retorna
      return DetailedCharacter.fromJson(response.data);
    } catch (e) {
      // Exibe o erro e relança para ser tratado em outra parte do código
      print('Erro ao obter os detalhes do personagem: $e');
      rethrow;  // Relançar o erro para ser tratado na página
    }
  }

  /// Método para obter uma lista de personagens.
  ///
  /// Este método faz uma requisição GET para buscar uma lista de personagens da API.
  /// A lista de personagens é paginada, e esse método aceita um número de página
  /// como argumento.
  ///
  /// [page] Número da página a ser buscada.
  /// Retorna uma lista de mapas contendo informações básicas dos personagens, como imagem, nome e ID.
  /// Lança um erro se a resposta não for bem-sucedida.
  static Future<List<Map<String, dynamic>>> getCharacters(int page) async {
    try {
      final response = await _dio.get('character', queryParameters: {'page': page});

      // Verifica se a resposta foi bem-sucedida
      if (response.statusCode == 200) {
        // Converte a lista de personagens da API em uma lista de mapas com dados básicos
        List<Map<String, dynamic>> charactersList = (response.data['results'] as List)
            .map((character) => {
          'image': character['image'],
          'text': character['name'],
          'id': character['id'].toString(),
        })
            .toList();

        return charactersList;
      } else {
        // Lança um erro caso a resposta não seja bem-sucedida
        throw Exception("Erro ao carregar a lista de personagens");
      }
    } catch (e) {
      // Exibe o erro caso a requisição falhe
      print("Erro ao carregar a lista de personagens: $e");
      rethrow;  // Relança o erro para ser tratado em outra parte do código
    }
  }
}
