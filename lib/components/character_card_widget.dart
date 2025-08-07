import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/pages/details_page1.dart'; // Certifique-se de importar a página de detalhes

class CharacterCardWidget extends StatelessWidget {
  final String image;
  final String text;

  const CharacterCardWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aqui você pode colocar a navegação para a página de detalhes, passando os parâmetros necessários
        if (kDebugMode) {
          print("Clicou no card: $text");
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage1(
              image: image,
              text: text,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: Color(0xff87A1FA)
          ,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                image,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
