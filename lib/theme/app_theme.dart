// Importando o pacote 'flutter/material.dart' que fornece widgets e ferramentas essenciais para o desenvolvimento de interfaces gráficas no Flutter.
import 'package:flutter/material.dart';

// A classe 'AppTheme' define os temas personalizados para o aplicativo.
class AppTheme {
  // 'lightTheme' é uma instância de ThemeData que configura o tema claro do aplicativo.
  // Este tema é configurado com uma cor primária e um estilo de texto personalizado.
  static final lightTheme = ThemeData(

    // 'primaryColor' define a cor principal do aplicativo, que será usada em widgets como botões, barras de navegação, entre outros.
    primaryColor: Colors.white, // A cor branca é escolhida como a cor primária para o tema.

    // 'textTheme' define o estilo global do texto utilizado em todo o aplicativo.
    textTheme: TextTheme(

      // 'bodyLarge' foi atualizado de 'bodyText1' para 'bodyLarge', e define o estilo do texto principal do corpo.
      bodyLarge: TextStyle(

        // 'fontFamily' define a fonte a ser usada. Neste caso, a fonte 'Lato' foi especificada.
        fontFamily: 'Lato',

        // 'fontSize' define o tamanho da fonte do texto. No caso, o tamanho é 16 pixels.
        fontSize: 16,

        // 'fontWeight' define a espessura do texto. Neste caso, o peso é 'w400', que é normal.
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
