// Importação do pacote Flutter para criar widgets.
import 'package:flutter/material.dart';

// Definição do widget ProfileIconWidget, que será usado para exibir o ícone de perfil
class ProfileIconWidget extends StatelessWidget {
  // O parâmetro 'key' é utilizado para identificar de forma única este widget.
  // A palavra-chave 'super.key' permite passar esse parâmetro para a classe pai (StatelessWidget).
  const ProfileIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna o layout do widget.
    return Padding(
      // Definindo um espaçamento de 15 pixels à direita do ícone, com o uso do Padding.
      padding: const EdgeInsets.only(right: 15.0),

      child: MouseRegion(
        // O 'MouseRegion' detecta quando o mouse entra ou sai da área do widget, útil para interações de hover (não implementados no momento).
        onEnter: (_) {},
        onExit: (_) {},

        // InkWell é um widget que permite efeitos visuais ao clicar (ex: ripple effect).
        child: InkWell(
          onTap: () {
            // Ao pressionar o ícone, um SnackBar é exibido com a mensagem "Ícone de login pressionado".
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ícone de login pressionado")));
          },

          // Definindo o borderRadius circular de 50 para criar um formato arredondado ao ícone ao tocá-lo.
          borderRadius: BorderRadius.circular(50),

          child: ClipOval(
            // 'ClipOval' é utilizado para garantir que a imagem tenha um formato circular.
            child: Image.network(
              // A URL da imagem do ícone de perfil é especificada. Aqui, se refere ao caminho para o ícone de perfil no diretório do aplicativo.
              'web/icons/profile_icon.png',
              // Definindo o tamanho da imagem para 31.46 pixels de largura e altura.
              width: 31.46,
              height: 31.46,
              // 'BoxFit.cover' garante que a imagem preencha a área definida, mantendo sua proporção e não distorcendo.
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
