import 'package:flutter/material.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';

class RestorePassword extends StatelessWidget {
  RestorePassword({super.key});

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void backLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void verifyPasswords(BuildContext context) {
    // Obtiene los valores de los controladores
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Verifica si son iguales
    if (newPassword == confirmPassword) {
      Navigator.pushNamed(context, '/login');
    } else {
      _showErrorDialog(context, 'Las contraseñas no son iguales');
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
        padding: const EdgeInsets.symmetric(
            horizontal: 25.0), // Añade algo de padding alrededor del contenido
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra verticalmente el contenido
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Estira los elementos horizontalmente
          children: [
            // Título en el centro
            const Text(
              'Restablecer',
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
                'Nueva Contraseña',
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            // Input box para el correo
            MyTextfield(
              controller: newPasswordController,
              hintText: 'Escriba su nueva contraseña',
              obscureText: true,
              validator: (value) => '',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Confirmar contraseña',
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            // Input box para el correo
            MyTextfield(
              controller: confirmPasswordController,
              hintText: 'Escriba su nueva contraseña',
              obscureText: true,
              validator: (value) => '',
            ),
            const SizedBox(height: 10),

            MyButton(
              onTap: () async {
                verifyPasswords(context);
              },
              colorBG: const Color.fromRGBO(0, 0, 0, 1),
              colorTxt: const Color.fromRGBO(255, 255, 255, 1),
              text: 'Iniciar sesion',
              hasBorder: true,
            ),
            const SizedBox(height: 350),
          ],
        ),
      ),
    );
  }
}
