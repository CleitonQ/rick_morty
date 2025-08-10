import 'package:dio/dio.dart'; // Usando Dio para realizar requisições HTTP (biblioteca que facilita a comunicação com a API)
import 'package:rick_morty/models/detailed_character.dart'; // Importando a classe DetailedCharacter, que contém os detalhes do personagem

// Classe Repository responsável por fazer as requisições para a API e obter os dados do personagem
abstract class Repository {
  // Instância de Dio configurada para fazer requisições HTTP à API do Rick and Morty.
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://rickandmortyapi.com/api/", // URL base da API
  ));

  // Método assíncrono que retorna os detalhes de um personagem com base no seu ID
  static Future<DetailedCharacter> getCharacterDetails(int characterId) async {
    try {
      // Fazendo a requisição GET à URL da API para pegar os detalhes do personagem com o ID fornecido.
      final response = await _dio.get('character/$characterId');

      // Verificando se a resposta da API foi bem-sucedida (status code 200)
      if (response.statusCode == 200) {
        // Se a resposta for bem-sucedida, converte os dados JSON da resposta para um objeto DetailedCharacter
        return DetailedCharacter.fromJson(response.data);
      } else {
        // Se a resposta não for bem-sucedida, lança uma exceção com a mensagem de erro
        throw Exception("Erro ao carregar detalhes do personagem");
      }
    } catch (e) {
      // Captura qualquer erro ocorrido durante a requisição e lança uma exceção
      throw Exception("Erro ao obter detalhes do personagem: $e");
    }
  }

  // Método assíncrono que retorna a lista de personagens da API
  static Future<List<Map<String, dynamic>>> getCharacters() async {
    try {
      // Fazendo a requisição GET à URL da API para pegar a lista de personagens
      final response = await _dio.get('character');

      // Verificando se a resposta da API foi bem-sucedida (status code 200)
      if (response.statusCode == 200) {
        // Se a resposta for bem-sucedida, converte os dados JSON da resposta para uma lista de mapas
        List<Map<String, dynamic>> charactersList = (response.data['results'] as List)
            .map((character) => {
          'image': character['image'],  // Adiciona a imagem do personagem
          'text': character['name'],    // Adiciona o nome do personagem
          'id': character['id']        // Adiciona o ID do personagem
        })
            .toList();
        return charactersList; // Retorna a lista de personagens
      } else {
        // Se a resposta não for bem-sucedida, lança uma exceção com a mensagem de erro
        throw Exception("Erro ao carregar a lista de personagens");
      }
    } catch (e) {
      // Captura qualquer erro ocorrido durante a requisição e lança uma exceção
      throw Exception("Erro ao obter lista de personagens: $e");
    }
  }
}
