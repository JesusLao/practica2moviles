// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practica2moviles/word/wordService.dart';
import 'dart:math'; // Importa la biblioteca de Dart para números aleatorios
import '../word/word.dart'; // Importa el modelo Word
import '../widgets/wordTile.dart'; // Importa el widget WordTile

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Word currentWord = Word(word: '');
  TextEditingController wordInputController = TextEditingController();
  String feedbackMessage = '';
  List<Word> wordList = [];

  @override
  void initState() {
    super.initState();
    _getRefreshWords();
    //startNewGame();
  }

  void _getRefreshWords() async {
    final data = await WordService.loadWords();
    setState(() {
      wordList = data;
      startNewGame();
    });
  }

  void startNewGame() {
    // WordService.insertCharacter(Word(word: "Tupac"));
    // final data = await WordService.loadCharacters();
    // setState(() {
    //   wordList = data;
    // });
    Word randomWord = wordList[Random().nextInt(wordList.length)];
    currentWord = randomWord;
    wordInputController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WordTile(word: currentWord),
            const SizedBox(height: 20),
            feedbackMessage.isNotEmpty
                ? Text(
                    feedbackMessage,
                    style: TextStyle(
                      color:
                          feedbackMessage.contains('¡Has adivinado la palabra!')
                              ? Colors.green
                              : Colors.red,
                    ),
                  )
                : Container(),
            SizedBox(height: 20),
            TextField(
              controller: wordInputController,
              decoration: const InputDecoration(
                labelText: 'Ingresa una palabra',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Procesa la palabra ingresada por el usuario
                feedbackMessage = '';
                processWord(wordInputController.text);
              },
              child: const Text('Adivinar Palabra'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                feedbackMessage = '';
                // Reinicia el juego
                startNewGame();
              },
              child: const Text('Reiniciar Juego'),
            ),
          ],
        ),
      ),
    );
  }

  void processWord(String word) {
    if (word.length == currentWord.word.length) {
      // Verifica la palabra ingresada por el usuario
      currentWord.updateGuessedWord(word);
      if (currentWord.isWordGuessed()) {
        // Aquí puedes agregar lógica adicional cuando se adivina la palabra
        feedbackMessage = '¡Has adivinado la palabra!';
      }
    } else {
      // Aquí puedes manejar la lógica cuando la longitud de la palabra no coincide

      feedbackMessage = 'La longitud de la palabra no coincide.';
    }

    // Limpia el campo de entrada
    wordInputController.clear();

    // Actualiza la interfaz de usuario
    setState(() {});
  }
}
