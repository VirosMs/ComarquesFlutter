import 'package:comarques/main.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const Registrer());
}

class Registrer extends StatelessWidget {
  const Registrer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPg(),
    );
  }
}

class RegisterPg extends StatefulWidget {
  const RegisterPg({Key? key}) : super(key: key);

  @override
  State<RegisterPg> createState() => _RegisterPgState();
}

class _RegisterPgState extends State<RegisterPg> {
  final _userController = TextEditingController();
  final _passwdController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.7;
    var logger = Logger();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/iesAlvaroFalomir.jpeg'),
            const Text(
              'Registro',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 16),
            SizedBox(
              width: maxWidth,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                      // TODO: implementar registro
                      logger.i('Usuario: ${_userController.text} \n'
                          'Email: ${_emailController.text} \n'
                          'Contraseña: ${_passwdController.text}');
                    },
                    child: const Text('Registrarse'),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    },
                    child: const Text('Volver'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
