import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:practica2moviles/word/word.dart';
import 'package:sqflite/sqflite.dart';

class WordService1 {
  static Future<Database> db() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'words1_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Words1(word TEXT PRIMARY KEY, desc TEXT, image TEXT)',
        );
      },
      version: 1,
    );
  }

  static const int _databaseVersion = 2; // Incrementa el número de versión

  // ...

  static Future<void> onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    // Realiza cambios en la estructura de la base de datos aquí
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE Words ADD COLUMN desc TEXT');
      await db.execute('ALTER TABLE Words ADD COLUMN image TEXT');
    }
  }

  static Future<void> insertWord(Word word) async {
    final connection = await db();
    await connection.insert(
      'Words1',
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Word>> loadWords() async {
    final connection = await db();

    final List<Map<String, dynamic>> maps = await connection.query('Words1');

    return List.generate(maps.length, (i) {
      return Word(
        word: maps[i]['word'] as String,
        desc: maps[i]['desc'] as String,
        image: maps[i]['image'] as String,
      );
    });
  }

  static Future<void> deleteWords(String word) async {
    final connection = await db();
    await connection.delete(
      'Words1',
      where: 'word = ?',
      whereArgs: [word],
    );
  }
}
