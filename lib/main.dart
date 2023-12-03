import 'package:flutter/material.dart';
import 'package:practica2moviles/accounts/account.dart';
import 'package:practica2moviles/accounts/accountService.dart';
import 'package:practica2moviles/word/word.dart';
import 'package:practica2moviles/word/wordService.dart';
import 'screens/homeScreen.dart';

void main() async {
  runApp(const MyApp());

  // AccountService.db();
  // var characters = await AccountService.loadAccounts();
  // print(characters);

  // WordService.db();
  // var characters = await WordService.loadWords();
  // print(characters);

  // WordService.insertCharacter(Word(word: "madre"));
  // WordService.insertCharacter(Word(word: "hijo"));
  // WordService.insertCharacter(Word(word: "ir"));
  // WordService.insertCharacter(Word(word: "regadera"));
  // WordService.insertCharacter(Word(word: "camara"));
  // WordService.insertCharacter(Word(word: "lampara"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Establece HomeScreen como la pantalla inicial
    );
  }
}
