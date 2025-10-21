import 'package:flutter_application_1/models/character.dart';
import 'package:flutter/material.dart';

class SingleCharacterDisplay extends StatelessWidget {
  const SingleCharacterDisplay({super.key, required this.character});

  final Character character;

  Widget _listSpacer() {
    return const SizedBox(height: 10);
  }

  Widget _singleCharacterHeader(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _singleCharacterTextElement(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    // Gradient
    elements.add(
      SizedBox(
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.red.shade400,
                Colors.white,
              ],
            ),
          ),
        ),
      ),
    );

    elements.add(_listSpacer());

    if (character.born.isNotEmpty) {
      elements.add(_singleCharacterHeader('📜 Born'));
      elements.add(_singleCharacterTextElement(character.born));
      elements.add(_listSpacer());
    }

    if (character.culture.isNotEmpty) {
      elements.add(_singleCharacterHeader('🎭 Culture'));
      elements.add(_singleCharacterTextElement(character.culture));
      elements.add(_listSpacer());
    }

    if (character.died.isNotEmpty) {
      elements.add(_singleCharacterHeader('☠️ Died'));
      elements.add(_singleCharacterTextElement(character.died));
      elements.add(_listSpacer());
    }
    
    return ListView(children: elements);
  }
}
