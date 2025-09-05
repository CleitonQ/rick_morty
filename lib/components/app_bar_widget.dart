import 'package:flutter/material.dart';

/// Widget customizado para o AppBar, usado em todas as telas do aplicativo.
///
/// O `AppBarWidget` é configurado para exibir um `AppBar` com comportamento
/// condicional dependendo se a página é uma página de detalhes ou não.
/// Ele também inclui um ícone de login e um logo centralizado.
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isDetailPage;  // Flag para determinar se a página é uma página de detalhes

  const AppBarWidget({super.key, this.isDetailPage = false});

  @override
  Size get preferredSize => Size.fromHeight(150);  // Define a altura do AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1C1B1F), // Cor sólida para o fundo do AppBar
      elevation: 4, // Sombra leve para destacar o AppBar
      leading: InkWell(
        borderRadius: BorderRadius.circular(50),  // Tornando o ícone interativo com borda arredondada
        onTap: () {
          if (isDetailPage) {
            _onBackPressed(context);  // Navegar para a página anterior se estiver na página de detalhes
          } else {
            _onMenuPressed();  // Exibe o menu se não for a página de detalhes
          }
        },
        child: Container(
          padding: EdgeInsets.all(4),
          child: Icon(
            isDetailPage ? Icons.arrow_back : Icons.menu,  // Ícone de volta ou menu, dependendo da página
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0), // Alinhamento do ícone de login à direita
          child: InkWell(
            onTap: _onLoginPressed,  // Ação do ícone de login
            borderRadius: BorderRadius.circular(50),
            child: ClipOval(
              child: Image.asset(
                'web/icons/profile_icon.png',  // Ícone do perfil do usuário
                width: 31.46,
                height: 31.46,
                fit: BoxFit.cover,  // A imagem é cortada para se ajustar ao formato circular
              ),
            ),
          ),
        ),
      ],
      centerTitle: true,  // Centraliza o título do AppBar
      flexibleSpace: _buildFlexibleSpace(),  // Espaço flexível para adicionar o logo e o título adicional
    );
  }

  /// Função para voltar para a tela anterior
  void _onBackPressed(BuildContext context) {
    if (isInDebugMode()) {
      print("Voltar Clicado");
    }
    Navigator.pop(context);  // Volta para a tela anterior
  }

  /// Função para o comportamento do Menu (caso contrário)
  void _onMenuPressed() {
    if (isInDebugMode()) {
      print("Menu Clicado");
    }
  }

  /// Função para o comportamento do ícone de login
  void _onLoginPressed() {
    if (isInDebugMode()) {
      print("Login Clicado");
    }
  }

  /// Verifica se o aplicativo está no modo de desenvolvimento (debug)
  bool isInDebugMode() {
    bool inDebugMode = false;
    assert(inDebugMode = true); // Será true apenas no modo de depuração (debug)
    return inDebugMode;
  }

  /// Método para construir o espaço flexível (logo e título do app)
  Widget _buildFlexibleSpace() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'web/icons/logo_icon.png',  // Logo do aplicativo
          width: 115,
          height: 76.99,
        ),
        SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            width: 197,
            height: 17,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,  // Ajusta o texto sem distorcer
              child: Text(
                'RICK AND MORTY API',  // Título do aplicativo
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14.5,
                  height: 1.0,
                  letterSpacing: 0.165,
                  color: Color(0xFFFFFFFF),  // Cor branca para o texto
                ),
                textAlign: TextAlign.center,  // Centraliza o texto
              ),
            ),
          ),
        ),
      ],
    );
  }
}
