import 'package:flutter/material.dart'; // Não se esqueça de importar o Flutter

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);  // Passando 'key' para o 'super'

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1C1B1F),
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {
          print("Menu Pressed");
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: MouseRegion(
            onEnter: (_) {},
            onExit: (_) {},
            child: InkWell(
              onTap: () {
                print("Ícone de login pressionado");
              },
              borderRadius: BorderRadius.circular(50),
              child: ClipOval(
                child: Image.asset(
                  'web/icons/profile_icon.png',  // Caminho correto para a imagem
                  width: 31.46,
                  height: 31.46,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
      centerTitle: true,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'web/icons/logo_icon.png',  // Caminho correto para a logo
            width: 115,
            height: 76.99,
          ),
          SizedBox(height: 5),
          Text(
            'RICK AND MORTY API',
            style: TextStyle(
              fontSize: 14.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
