import 'package:flutter/material.dart';
import 'dart:math'; // Importa la biblioteca de Dart para números aleatorios
import '../word.dart'; // Importa el modelo Word
import '../widgets/wordTile.dart'; // Importa el widget WordTile

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Word currentWord;
  TextEditingController wordInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    List<String> wordList = ['flutter', 'dart', 'mobile', 'developer'];
    String randomWord = wordList[Random().nextInt(wordList.length)];
    currentWord = Word(word: randomWord);
    wordInputController.clear();
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
            WordTile(word: currentWord),
            SizedBox(height: 20),
            TextField(
              controller: wordInputController,
              decoration: InputDecoration(
                labelText: 'Ingresa una palabra',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Procesa la palabra ingresada por el usuario
                processWord(wordInputController.text);
              },
              child: Text('Adivinar Palabra'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reinicia el juego
                startNewGame();
              },
              child: Text('Reiniciar Juego'),
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
        print('¡Has adivinado la palabra!');
      }
    } else {
      // Aquí puedes manejar la lógica cuando la longitud de la palabra no coincide
      print('La longitud de la palabra no coincide');
    }

    // Limpia el campo de entrada
    wordInputController.clear();

    // Actualiza la interfaz de usuario
    setState(() {});
  }
}
