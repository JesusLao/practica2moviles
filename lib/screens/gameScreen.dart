import 'package:flutter/material.dart';
import 'dart:math'; // Importa la biblioteca de Dart para números aleatorios
import '../word.dart'; // Importa el modelo Word
import '../widgets/wordTile.dart'; // Importa el widget WordTile

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Word currentWord; // Palabra actual
  late List<String> availableLetters; // Letras disponibles para adivinar
  late List<String> guessedLetters; // Letras adivinadas por el usuario

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  // Inicia un nuevo juego
  void startNewGame() {
    // Lista de palabras de ejemplo (puedes agregar más)
    List<String> wordList = ['flutter', 'dart', 'mobile', 'developer'];

    // Selecciona una palabra aleatoria de la lista
    String randomWord = wordList[Random().nextInt(wordList.length)];

    // Inicializa el objeto Word
    currentWord = Word(word: randomWord);

    // Inicializa las letras disponibles y adivinadas
    availableLetters = List.generate(
        26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
    guessedLetters = [];

    // Actualiza la interfaz de usuario
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordle Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // WordTile(word: currentWord, guessedLetters: guessedLetters),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildLetterButtons(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reinicia el juego al hacer clic en el botón
                startNewGame();
              },
              child: Text('Reiniciar Juego'),
            ),
          ],
        ),
      ),
    );
  }

  // Construye los botones de letras disponibles
  List<Widget> buildLetterButtons() {
    return availableLetters.map((letter) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Procesa la letra cuando se hace clic
            processLetter(letter);
          },
          child: Text(letter),
        ),
      );
    }).toList();
  }

  // Procesa la letra seleccionada por el usuario
  void processLetter(String letter) {
    // Actualiza la lista de letras disponibles y adivinadas
    setState(() {
      availableLetters.remove(letter);
      guessedLetters.add(letter);
    });

    // Verifica si la letra está en la palabra objetivo
    // if (currentWord.word.contains(letter.toLowerCase())) {
    //   currentWord.updateGuessedLetters(letter);
    // }

    // // Verifica si el jugador ha adivinado la palabra
    // if (currentWord.isWordGuessed()) {
    //   // Aquí puedes agregar lógica adicional cuando se adivina la palabra
    //   print('¡Has adivinado la palabra!');
    // }
  }
}
