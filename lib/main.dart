import 'package:comarques/screens/provincia.dart';
import 'package:comarques/screens/registrer.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// This is the main entry point for the Flutter application.
/// It creates and runs an instance of the [MyApp] widget.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
/// It sets the [LoginPg] widget as the home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPg(),
    );
  }
}

/// The login page widget.
/// It contains the UI elements for user login.
class LoginPg extends StatefulWidget {
  const LoginPg({super.key});

  @override
  State<LoginPg> createState() => _LoginPgState();
}

class _LoginPgState extends State<LoginPg> {
  final _userController = TextEditingController();
  final _passwdController = TextEditingController();
  final imgLogo = const AssetImage('assets/logo.png');

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.8;
    var logger = Logger();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/iesAlvaroFalomir.jpeg'),
              const Text(
                'Les comarques de la comunitat',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: maxWidth,
                child: TextFormField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: maxWidth,
                child: TextFormField(
                  controller: _passwdController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Provincia()),
                        );
                        logger.i(
                            '--Login-- \n Email: ${_userController.text} \n Pass: ${_passwdController.text}');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 30,
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      child: const Text('Sign Up'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registrer()),
                        );
                        
                        logger.i(
                            'Redirigido a la pantalla de registro');
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
