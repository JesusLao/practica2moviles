import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:practica2moviles/accounts/account.dart';
import 'package:sqflite/sqflite.dart';

class AccountService {
  static Future<Database> db() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'accounts_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Accounts(mail TEXT PRIMARY KEY, user TEXT, password TEXT, trys INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<Account?> insertAccount(Account account) async {
    final existingAccount = await findAccount(account);

    // Si ya existe una cuenta con el mismo correo electrónico, devuelve null
    if (existingAccount != null) {
      return null;
    }

    // Si no existe, inserta la cuenta en la base de datos
    final connection = await db();
    await connection.insert(
      'Accounts',
      account.toMap(),
      conflictAlgorithm: ConflictAlgorithm
          .ignore, // Utiliza "ignore" para que no reemplace en caso de conflicto
    );

    // Devuelve la cuenta que acabas de insertar
    return account;
  }

  static Future<List<Account>> loadAccounts() async {
    final connection = await db();
    final List<Map<String, dynamic>> maps = await connection.query('Accounts');
    return List.generate(maps.length, (i) {
      return Account(
        mail: maps[i]['mail'] as String,
        user: maps[i]['user'] as String,
        password: maps[i]['password'] as String,
        trys: maps[i]['trys'] as int?,
      );
    });
  }

  static Future<Account?> findAccount(Account account) async {
    final connection = await db();

    List<Map<String, dynamic>> result = await connection.query(
      'Accounts',
      where: 'mail = ?',
      whereArgs: [account.mail],
    );

    if (result.isNotEmpty) {
      // Si se encontró una cuenta con el mismo correo electrónico, devolverla como objeto Account
      return Account(
        mail: result[0]['mail'] as String,
        user: result[0]['user'] as String,
        password: result[0]['password'] as String,
        trys: result[0]['trys'] as int?,
      );
    } else {
      // Si no se encontró ninguna cuenta, devolver null
      return null;
    }
  }

  static Future<Account?> updateAccount(Account account) async {
    final existingAccount = await findAccount(account);

    // Si la cuenta no existe, no se puede actualizar
    if (existingAccount == null) {
      return null;
    }

    // Actualiza la cuenta en la base de datos
    final connection = await db();
    await connection.update(
      'Accounts',
      account.toMap(),
      where: 'mail = ?',
      whereArgs: [account.mail],
    );

    // Devuelve la cuenta actualizada
    return account;
  }

  static Future<List<Account>> loadRankedAccounts() async {
    final connection = await db();
    final List<Map<String, dynamic>> maps = await connection.query(
      'Accounts',
      orderBy: 'trys ASC', // Ordena por trys en orden ascendente
    );
    return List.generate(maps.length, (i) {
      return Account(
        mail: maps[i]['mail'] as String,
        user: maps[i]['user'] as String,
        password: maps[i]['password'] as String,
        trys: maps[i]['trys'] as int?,
      );
    });
  }
}
