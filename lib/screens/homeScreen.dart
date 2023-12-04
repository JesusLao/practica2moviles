import 'package:flutter/material.dart';
import 'package:practica2moviles/accounts/account.dart';
import 'package:practica2moviles/accounts/accountService.dart';
import 'gameScreen.dart';
import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  late Account accountLogged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/Inicio_GIF.png"), // Reemplaza con la ruta correcta de tu imagen
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 400),
              ElevatedButton(
                onPressed: () async {
                  final loggedInAccount = await Navigator.push<Account?>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
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
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
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
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
        backgroundColor: Colors
            .transparent, // Establece el color de fondo de la AppBar como transparente
        elevation: 0, // Elimina la sombra de la AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'), // Ruta de la imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: 'Correo Electrónico',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    Navigator.pop(
                      context,
                      Account(mail: email, user: '', password: password),
                    );
                  } else {
                    // Puedes mostrar un mensaje de error si los campos no están completos
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error de Inicio de Sesión'),
                          content: const Text(
                              'Por favor, completa todos los campos.'),
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
                },
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/fondo.jpg'), // Reemplaza 'assets/background_image.jpg' con la ruta de tu imagen
            fit: BoxFit
                .cover, // Puedes ajustar cómo la imagen cubre el contenedor
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de Usuario',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (username.isNotEmpty &&
                      email.isNotEmpty &&
                      password.isNotEmpty) {
                    Navigator.pop(
                      context,
                      Account(
                        mail: email,
                        user: username,
                        password: password,
                      ),
                    );
                  } else {
                    // Puedes mostrar un mensaje de error si los campos no están completos
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error de Registro'),
                          content: const Text(
                              'Por favor, completa todos los campos.'),
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
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
