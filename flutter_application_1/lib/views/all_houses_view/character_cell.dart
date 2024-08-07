import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/views/single_character_view/single_character_display.dart';
import 'package:flutter/material.dart';

class CharacterCell extends StatelessWidget {
  const CharacterCell({super.key, required this.character});

  final Character character;

  Color _colorMain() {
    return Colors.red.shade400;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: _colorMain(),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _colorMain().withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
          ),
          child: SizedBox(
            width: width - 16 * 2,
            height: 36,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(character.name),
                        backgroundColor: Colors.red.shade400,
                        foregroundColor: Colors.white,
                      ),
                      body: SingleCharacterDisplay(character: character),
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 12,
                        child: Text(
                          character.initial(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        character.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
