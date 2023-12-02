import 'package:flutter/material.dart';
import '../word.dart';

class WordTile extends StatelessWidget {
  final Word word;

  WordTile({required this.word});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Palabra a Adivinar:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          children: buildLetterTiles(),
        ),
      ],
    );
  }

  List<Widget> buildLetterTiles() {
    List<String> displayWord = word.getDisplayWord();
    return displayWord.asMap().entries.map((entry) {
      int index = entry.key;
      String letter = entry.value;

      return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
          color: getLetterColor(index, letter),
        ),
        child: Text(
          letter,
          style: TextStyle(fontSize: 20),
        ),
      );
    }).toList();
  }

  Color? getLetterColor(int index, String letter) {
    bool isGuessed = word.guessedLetters.contains(letter.toLowerCase());
    if (isGuessed) {
      if (word.isLetterInCorrectPosition(index, letter)) {
        // Letra en la posición correcta (verde)
        return Colors.green;
      } else {
        // Letra en otra posición (amarillo)
        return Colors.yellow;
      }
    }
    return null; // No resaltar letras no adivinadas
  }
}
