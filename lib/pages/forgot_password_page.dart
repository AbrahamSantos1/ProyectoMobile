import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';
import 'package:control_salud_infantil/models/datos.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final usernameController = TextEditingController();

  Future<String> loadJsonData() async {
    return await rootBundle.loadString('lib/json/datos.json');
  }

  Usuario? buscarUsuarioEnJson(String email, List<Usuario> usuarios) {
    for (Usuario usuario in usuarios) {
      if (usuario.email == email) {
        return usuario;
      }
    }
    return null;
  }

  void signUserIn(BuildContext context, String jsonString) async {
    final email = usernameController.text;

    try {
      // Parse JSON and get the list of users
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      List<Usuario> usuarios = (jsonMap['usuarios'] as List<dynamic>)
          .map((userJson) => Usuario.fromJson(userJson as Map<String, dynamic>))
          .toList();

      // Authenticate the user
      Usuario? usuarioAutenticado = buscarUsuarioEnJson(email, usuarios);

      if (usuarioAutenticado != null) {
        // Navigate to home and pass the user data
        Navigator.pushNamed(context, '/enter_code',
            arguments: usuarioAutenticado);
      } else {
        _showErrorDialog(
            context, 'Error en la autenticación. Verifica tus credenciales.');
      }
    } catch (e) {
      _showErrorDialog(context,
          'Error al procesar los datos. Asegúrate de que el formato sea correcto.');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(
            20.0), // Añade algo de padding alrededor del contenido
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra verticalmente el contenido
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Estira los elementos horizontalmente
          children: [
            // Título en el centro
            const Text(
              'Recuperar',
              textAlign: TextAlign.center, // Centra el texto
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Contraseña',
              textAlign: TextAlign.center, // Centra el texto
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Correo Electrónico',
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            // Input box para el correo
            MyTextfield(
              controller: usernameController,
              hintText: 'Ingresa tu correo electronico',
              obscureText: false,
              validator: (value) => '',
            ),
            const SizedBox(height: 10),

            MyButton(
              onTap: () async {
                String jsonString = await loadJsonData(); // Load JSON
                // ignore: use_build_context_synchronously
                signUserIn(context, jsonString); // Pass JSON to the method
              },
              colorBG: const Color.fromRGBO(0, 0, 0, 1),
              colorTxt: const Color.fromRGBO(255, 255, 255, 1),
              text: 'Enviar Codigo',
              hasBorder: true,
            ),
            const SizedBox(height: 350),
          ],
        ),
      ),
    );
  }
}
