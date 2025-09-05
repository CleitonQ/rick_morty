// Importação das dependências necessárias
import 'package:flutter/material.dart';
import 'package:rick_morty/components/app_bar_widget.dart';
import 'package:rick_morty/components/character_card_widget.dart';
import 'package:rick_morty/models/character_page.dart'; // Corrigido o caminho da importação
import 'package:rick_morty/data/repository.dart'; // Para buscar os dados da API

/// Página inicial do aplicativo que exibe a lista de personagens.
///
/// A HomePage gerencia o estado de carregamento de personagens e
/// carrega mais personagens conforme o usuário rola a tela para baixo.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 1; // Página inicial
  List<Map<String, dynamic>> characterData = []; // Lista para armazenar os personagens
  bool isLoading = false; // Flag de carregamento
  bool hasMore = true; // Flag para saber se há mais personagens
  ScrollController _scrollController = ScrollController(); // Controlador do scroll

  @override
  void initState() {
    super.initState();
    _loadCharacters(); // Carregar os personagens ao iniciar

    // Adicionando o listener ao controlador de scroll
    _scrollController.addListener(() {
      // Verifica se o usuário chegou ao final da lista e não está carregando mais dados
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          !isLoading && hasMore) {
        _loadCharacters(); // Chama a função para carregar mais personagens
      }
    });
  }

  /// Função assíncrona para carregar os personagens da API.
  ///
  /// Quando os personagens são carregados, a página é incrementada e os dados são adicionados à lista.
  /// Se não houver mais personagens, a flag `hasMore` é desativada.
  Future<void> _loadCharacters() async {
    setState(() {
      isLoading = true; // Marca que estamos carregando os dados
    });

    try {
      final characters = await Repository.getCharacters(page); // Carrega personagens da API
      setState(() {
        page++; // Incrementa o número da página para a próxima requisição
        if (characters.isEmpty) {
          hasMore = false; // Se não houver mais personagens, marca como falso
        } else {
          characterData.addAll(characters); // Adiciona os novos personagens à lista
        }
        isLoading = false; // Desmarca o carregamento
      });
    } catch (e) {
      print("Erro ao carregar personagens: $e");
      setState(() {
        isLoading = false; // Desmarca o carregamento em caso de erro
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Largura da tela para responsividade

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(131), // Tamanho do AppBar
        child: AppBarWidget(), // Widget personalizado para a AppBar
      ),
      backgroundColor: Colors.black, // Cor de fundo da página
      body: SingleChildScrollView(
        controller: _scrollController, // Associando o ScrollController para detectar o final da lista
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05), // Adicionando padding nas laterais
          child: Column(
            children: [
              // Gerando a lista de personagens dinamicamente
              ...List.generate(characterData.length, (index) {
                var item = characterData[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.50), // Espaçamento entre os itens
                  child: GestureDetector(
                    onTap: () {
                      // Navegação para a tela de detalhes do personagem
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterPage(
                            characterId: int.parse(item['id']!), // Passando o id para a próxima tela
                          ),
                        ),
                      );
                    },
                    child: CharacterCardWidget(
                      image: item['image']!, // Imagem do personagem
                      text: item['text']!,  // Nome do personagem
                      id: int.parse(item['id']!),  // ID do personagem
                    ),
                  ),
                );
              }),

              // Exibindo indicador de carregamento enquanto carrega mais dados
              if (isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CircularProgressIndicator(),
                ),

              // Caso não tenha mais personagens, exibe uma mensagem
              if (!hasMore)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Não há mais personagens.",
                    style: TextStyle(color: Colors.white), // Estilo do texto
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
