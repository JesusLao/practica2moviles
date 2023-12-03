import 'package:flutter/material.dart';
import 'package:practica2moviles/accounts/account.dart';
import 'package:practica2moviles/accounts/accountService.dart';
import 'gameScreen.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  late Account accountLogged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a Wordle!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final loggedInAccount = await Navigator.push<Account?>(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
                onLogin(context, loggedInAccount);
              },
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final signedUpAccount = await Navigator.push<Account?>(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
                onSignUp(context, signedUpAccount);
              },
              child: const Text('Registrarse'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final rankedAccounts =
                    await AccountService.loadRankedAccounts();
                showRankingDialog(context, rankedAccounts);
              },
              child: const Text('Ver Ranking'),
            ),
          ],
        ),
      ),
    );
  }

  void onLogin(BuildContext context, Account? loggedInAccount) async {
    if (loggedInAccount != null) {
      // Verificar si la cuenta existe en la base de datos
      final accounts = await AccountService.loadAccounts();
      final existingAccount = accounts
          .firstWhereOrNull((account) => account.mail == loggedInAccount.mail);

      if (existingAccount != null) {
        accountLogged = existingAccount;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameScreen(
                    accountLogged: accountLogged,
                  )),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error de inicio de sesión'),
              content: const Text(
                  'La cuenta no existe o las credenciales son incorrectas.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void onSignUp(BuildContext context, Account? signedUpAccount) async {
    if (signedUpAccount != null) {
      // Verificar si la cuenta ya existe en la base de datos
      final accounts = await AccountService.loadAccounts();
      final existingAccount = accounts
          .firstWhereOrNull((account) => account.mail == signedUpAccount.mail);

      if (existingAccount == null) {
        accountLogged = signedUpAccount;
        // Insertar la nueva cuenta en la base de datos
        await AccountService.insertAccount(signedUpAccount);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameScreen(
                    accountLogged: accountLogged,
                  )),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error de registro'),
              content: const Text(
                  'La cuenta ya existe. Por favor, utiliza otro correo electrónico.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void showRankingDialog(BuildContext context, List<Account> rankedAccounts) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ranking de Mejores Intentos'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: rankedAccounts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    '${index + 1}. ${rankedAccounts[index].user}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index < 3 ? Colors.green : Colors.black,
                    ),
                  ),
                  subtitle:
                      Text('Intentos: ${rankedAccounts[index].trys ?? 0}'),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    Account(
                        mail: 'correo@example.com',
                        user: 'Usuario',
                        password: 'contraseña'));
              },
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Nombre de Usuario'),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    Account(
                        mail: 'correo@example.com',
                        user: 'Usuario',
                        password: 'contraseña'));
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
