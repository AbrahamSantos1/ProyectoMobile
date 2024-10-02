import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Load JSON data from file
  Future<String> loadJsonData() async {
    return await rootBundle.loadString('lib/json/datos.json');
  }

  Usuario? buscarUsuarioEnJson(
      String email, String password, List<Usuario> usuarios) {
    for (Usuario usuario in usuarios) {
      if (usuario.correo == email && usuario.contrasena == password) {
        return usuario;
      }
    }
    return null;
  }

  void signUserIn(BuildContext context, String jsonString) async {
    final email = usernameController.text;
    final password = passwordController.text;

    try {
      // Parse JSON and get the list of users
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      List<Usuario> usuarios = (jsonMap['usuarios'] as List<dynamic>)
          .map((userJson) => Usuario.fromJson(userJson as Map<String, dynamic>))
          .toList();

      // Authenticate the user
      Usuario? usuarioAutenticado =
          buscarUsuarioEnJson(email, password, usuarios);

      if (usuarioAutenticado != null) {
        // Navigate to home and pass the user data
        Navigator.pushNamed(context, '/home', arguments: usuarioAutenticado);
      } else {
        _showErrorDialog(
            context, 'Error en la autenticación. Verifica tus credenciales.');
      }
    } catch (e) {
      _showErrorDialog(context,
          'Error al procesar los datos. Asegúrate de que el formato sea correcto.');
      print("Error parsing JSON: $e");
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void createAccount(BuildContext context) {
    Navigator.pushNamed(context, '/create_account');
  }

  void forgotPassword() {
    // Logic for password recovery (optional)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Divider(thickness: 0.5),
                Center(
                  child: Image.asset(
                    'lib/images/logo.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Correo Electrónico',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                MyTextfield(
                  controller: usernameController,
                  hintText: 'Ingresa tu correo electrónico',
                  obscureText: false,
                  validator: (value) => '',
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Contrasena',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Ingresa tu contrasena',
                  obscureText: true,
                  validator: (value) => '',
                ),
                const SizedBox(height: 150),
                MyButton(
                  onTap: forgotPassword,
                  colorBG: Colors.white,
                  colorTxt: Colors.black,
                  text: '¿Olvidaste tu contrasena?',
                  hasBorder: true,
                ),
                const SizedBox(height: 10),
                MyButton(
                  onTap: () => createAccount(context),
                  colorBG: Colors.white,
                  colorTxt: Colors.black,
                  text: '¿Crear cuenta?',
                  hasBorder: true,
                ),
                const SizedBox(height: 10),
                MyButton(
                  onTap: () async {
                    String jsonString = await loadJsonData(); // Load JSON
                    // ignore: use_build_context_synchronously
                    signUserIn(context, jsonString); // Pass JSON to the method
                  },
                  text: 'Iniciar sesión',
                  colorBG: Colors.black,
                  colorTxt: Colors.white,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
