import 'package:flutter/material.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';

class EnterCode extends StatelessWidget {
  EnterCode({super.key});

  final usernameController = TextEditingController();

  void checkCode(BuildContext context) {
    Navigator.pushNamed(context, '/restore_pass');
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
              'Codigo',
              textAlign: TextAlign.center, // Centra el texto
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enviado',
              textAlign: TextAlign.center, // Centra el texto
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Codigo',
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            // Input box para el correo
            MyTextfield(
              controller: usernameController,
              hintText: 'Ingresar el codigo',
              obscureText: false,
              validator: (value) => '',
            ),
            const SizedBox(height: 10),

            MyButton(
              onTap: () => checkCode(context),
              colorBG: const Color.fromRGBO(0, 0, 0, 1),
              colorTxt: const Color.fromRGBO(255, 255, 255, 1),
              text: 'Comprobar codigo',
              hasBorder: true,
            ),
            const SizedBox(height: 350),
          ],
        ),
      ),
    );
  }
}
