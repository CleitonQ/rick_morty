// Importação das dependências necessárias
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Classe responsável pela configuração do tema do aplicativo.
class AppTheme {
  /// Retorna o tema claro configurado para o aplicativo.
  ///
  /// O tema utiliza o Google Fonts para definir a fonte 'Lato'
  /// e configura o texto principal com estilo personalizado.
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.white, // Cor principal do tema (branco).

      // Configuração do tema de texto usando a fonte 'Lato' do Google Fonts.
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          // Definição do estilo do texto principal do corpo (larger body text).
          bodyLarge: TextStyle(
            fontFamily: 'Lato', // Família de fontes: 'Lato'.
            fontSize: 16, // Tamanho da fonte.
            fontWeight: FontWeight.w400, // Peso da fonte (normal).
          ),
        ),
      ),
    );
  }
}
