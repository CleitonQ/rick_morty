import 'package:flutter/material.dart';

// O widget 'AppBarWidget' é uma barra de navegação personalizada para o aplicativo
// Ela se ajusta conforme a página em que está, exibindo um ícone de voltar ou menu.
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isDetailPage;  // Indica se estamos na página de detalhes (se sim, a seta de voltar é mostrada)

  // O construtor recebe um parâmetro opcional 'isDetailPage' para configurar o ícone a ser mostrado.
  const AppBarWidget({super.key, this.isDetailPage = false});

  // Define a altura da AppBar
  @override
  Size get preferredSize => Size.fromHeight(150);  // A altura da AppBar será 150px

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1C1B1F),  // Cor de fundo da AppBar (tom escuro)

      // Ícone de navegação (Menu ou Voltar)
      leading: InkWell(
        borderRadius: BorderRadius.circular(50),  // Borda arredondada para o efeito ripple circular
        onTap: () {
          if (isDetailPage) {
            print("Voltar clicado");  // Se for página de detalhes, imprime no console e volta para a tela inicial
            Navigator.pop(context);  // Navega para a tela anterior (voltar)
          } else {
            print("Menu Clicado");  // Caso contrário, imprime no console indicando que o menu foi clicado
          }
        },
        child: Container(
          padding: EdgeInsets.all(4),  // Ajusta o padding do ícone (diminuindo para efeito ripple menor)
          child: Icon(
            isDetailPage ? Icons.arrow_back : Icons.menu,  // Se for página de detalhes, exibe a seta de voltar, caso contrário, exibe o ícone de menu
            color: Colors.white,  // Cor do ícone é branco
          ),
        ),
      ),

      // Ícone de perfil no lado direito
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),  // Adiciona espaçamento à direita do ícone
          child: MouseRegion(
            onEnter: (_) {},  // Não faz nada ao passar o mouse sobre o ícone (não implementado)
            onExit: (_) {},   // Não faz nada ao retirar o mouse do ícone (não implementado)
            child: InkWell(
              onTap: () {
                print("login Clicado");  // Quando o ícone é pressionado, imprime "login clicado" no console
              },
              borderRadius: BorderRadius.circular(35),  // Define a borda arredondada do ícone (raio de 35)
              child: ClipOval(
                child: Image.asset(
                  'web/icons/profile_icon.png',  // Caminho da imagem do ícone de perfil
                  width: 31.46,  // Largura do ícone de perfil
                  height: 31.46,  // Altura do ícone de perfil
                  fit: BoxFit.cover,  // Faz com que a imagem cubra todo o espaço sem distorcer
                ),
              ),
            ),
          ),
        ),
      ],

      centerTitle: true,  // Centraliza o título da AppBar

      // Espaçamento e conteúdo centralizado dentro da AppBar
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Centraliza os widgets filhos verticalmente
        children: [
          // Logo do aplicativo
          Image.asset(
            'web/icons/logo_icon.png',  // Caminho correto para a logo
            width: 115,  // Largura da logo
            height: 76.99,  // Altura da logo
          ),
          // Espaço entre a logo e o texto
          SizedBox(height: 0),  // Pode ser ajustado se precisar de mais espaço entre a logo e o texto
          Padding(
            padding: const EdgeInsets.only(top: 0),  // Ajuste o padding conforme necessário
            child: Text(
              'RICK AND MORTY API',  // Texto abaixo da logo
              style: TextStyle(
                fontSize: 14.5,  // Tamanho da fonte
                color: Color(0xFFFFFFFF),  // Cor do texto (branco)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
