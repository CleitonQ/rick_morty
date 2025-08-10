// Importando pacotes necessários para o projeto
import 'package:flutter/material.dart'; // Pacote principal do Flutter, fornece widgets e ferramentas para criar a interface do usuário.
import 'package:rick_morty/pages/home_page.dart'; // Importando a página principal, 'HomePage', onde a tela inicial do aplicativo é definida.
import 'package:google_fonts/google_fonts.dart'; // Pacote do Google Fonts para permitir o uso de fontes personalizadas no aplicativo.

void main() {
  runApp(MyApp()); // Função 'main', ponto de entrada do aplicativo. Inicia o widget 'MyApp'.
}

// 'MyApp' é um widget do tipo StatelessWidget que representa a estrutura geral do aplicativo.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // O parâmetro 'super.key' é utilizado para passar a chave para o construtor da classe pai (StatelessWidget).

  @override
  Widget build(BuildContext context) {
    // A função 'build' é responsável por construir a interface do aplicativo.
    return MaterialApp(
      // 'MaterialApp' é um widget de alto nível que configura o estilo visual do aplicativo, baseado no Material Design.
      debugShowCheckedModeBanner: false, // Desabilita o banner de depuração que aparece no canto superior direito durante o desenvolvimento.

      title: 'CleitonQ - Kode Start 2025', // Define o título do aplicativo que aparece na barra de tarefas ou no título da janela do navegador.

      theme: ThemeData(
        // 'ThemeData' define as configurações de tema global para o aplicativo.
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme, // Aplica a fonte 'Lato' em todo o aplicativo, mantendo os estilos de texto padrão, mas alterando para a fonte 'Lato'.
        ),
      ),

      home: HomePage(), // Define a tela inicial do aplicativo. O widget 'HomePage' será carregado quando o aplicativo for iniciado.
    );
  }
}
