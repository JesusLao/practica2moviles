import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:practica2moviles/word/word.dart';
import 'package:sqflite/sqflite.dart';

class WordService {
  static Future<Database> db() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'words_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Words(word TEXT PRIMARY KEY)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertWord(Word word) async {
    final connection = await db();
    await connection.insert(
      'Words',
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Word>> loadWords() async {
    final connection = await db();

    final List<Map<String, dynamic>> maps = await connection.query('Words');

    return List.generate(maps.length, (i) {
      return Word(
        word: maps[i]['word'] as String,
      );
    });
  }
}
