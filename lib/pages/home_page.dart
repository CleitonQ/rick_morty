import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Lista com os dados das imagens e textos
  final List<Map<String, String>> data = [
    {
      'image': 'https://rickandmortyapi.com/api/character/avatar/200.jpeg',
      'text': 'LAWYER MORTY'
    },
    {
      'image': 'https://rickandmortyapi.com/api/character/avatar/379.jpeg',
      'text': 'WEDDING BARTENDER'
    },
    {
      'image': 'https://rickandmortyapi.com/api/character/avatar/603.jpeg',
      'text': 'CROSSY'
    },
    {
      'image': 'https://rickandmortyapi.com/api/character/avatar/616.jpeg',
      'text': 'PHANTOM OF THE OPERA FAN'
    },
    {
      'image': 'https://rickandmortyapi.com/api/character/avatar/663.jpeg',
      'text': 'REGGIE'
    },
    {
      'image': 'https://rickandmortyapi.com/api/character/avatar/676.jpeg',
      'text': "JAPHETH'S MIDDLE SON"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Cor de fundo da tela inteira
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Aumenta a altura da AppBar
        child: AppBar(
          backgroundColor: Color(0xFF1C1B1F),
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Color(0xFFFFFFFF),
            onPressed: () {
              print("Menu Pressed");
            },
          ),
          centerTitle: true, // Centraliza o título da AppBar
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            children: [
              // Logo centralizada
              Image.network(
                'web/icons/Group_119.png', // Logo
                width: 115,
                height: 76.99,
              ),
              SizedBox(height: 5),
              Text(
                'RICK AND MORTY API',  // Texto abaixo da logo
                style: GoogleFonts.lato(
                  fontSize: 14.5,
                  height: 17 / 14.5,
                  letterSpacing: 0.165,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          actions: [
            // Ícone de perfil no canto superior direito
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: MouseRegion(  // Detecta quando o cursor passa sobre o ícone
                onEnter: (_) {
                  // O cursor é alterado automaticamente pelo MouseRegion para 'click'
                },
                onExit: (_) {},
                child: InkWell( // Efeito visual ao clicar (com o InkWell, você não precisa de GestureDetector)
                  onTap: () {
                    // A ação que você deseja realizar após o clique
                    print("Ícone de login pressionado");

                    // Exemplo de ação após o clique (pode ser navegação ou outro comando)
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  borderRadius: BorderRadius.circular(50), // Borda arredondada para o efeito de clique
                  child: ClipOval(
                    child: Image.network(
                      'web/icons/icon.png', // Exemplo de ícone com fundo transparente
                      width: 31.46,
                      height: 31.46,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],


        ),
      ),
      body: SingleChildScrollView( // Permite rolagem quando necessário
        child: Column(
          children: List.generate(data.length, (index) {
            var item = data[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 320, // Largura do retângulo
              height: 160, // Altura do retângulo
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16), // Bordas arredondadas do container
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16), // Bordas arredondadas na parte superior esquerda
                      topRight: Radius.circular(16), // Bordas arredondadas na parte superior direita
                    ),
                    child: Image.network(
                      item['image']!,
                      width: double.infinity,
                      height: 120, // Ajuste a altura para não causar overflow
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10), // Espaçamento entre a imagem e o texto
                  Align(  // Alinha o texto à esquerda
                    alignment: Alignment.centerLeft,  // Alinhamento à esquerda
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),  // Espaçamento à esquerda
                      child: Text(
                        item['text']!,
                        style: GoogleFonts.lato(
                          fontSize: 14.5,
                          height: 17 / 14.5,
                          letterSpacing: 0.165,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
