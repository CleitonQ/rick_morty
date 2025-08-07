import 'package:flutter/material.dart';

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: MouseRegion(
        onEnter: (_) {},
        onExit: (_) {},
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ícone de login pressionado")));
          },
          borderRadius: BorderRadius.circular(50),
          child: ClipOval(
            child: Image.network(
              'web/icons/profile_icon.png',
              width: 31.46,
              height: 31.46,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
