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
    return displayWord.map((letter) {
      return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          letter,
          style: TextStyle(fontSize: 20),
        ),
      );
    }).toList();
  }
}
