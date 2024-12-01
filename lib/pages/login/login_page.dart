import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';
import 'package:control_salud_infantil/pages/login/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final SignInController signInController = SignInController();

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
                  controller: signInController.usernameController,
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
                  controller: signInController.passwordController,
                  hintText: 'Ingresa tu contrasena',
                  obscureText: true,
                  validator: (value) => '',
                ),
                const SizedBox(height: 150),
                MyButton(
                  onTap: () => signInController.forgotPassword(context),
                  colorBG: Colors.white,
                  colorTxt: Colors.black,
                  text: '¿Olvidaste tu contrasena?',
                  hasBorder: true,
                ),
                const SizedBox(height: 10),
                MyButton(
                  onTap: () => signInController.createAccount(context),
                  colorBG: Colors.white,
                  colorTxt: Colors.black,
                  text: '¿Crear cuenta?',
                  hasBorder: true,
                ),
                const SizedBox(height: 10),
                MyButton(
                  onTap: () => signInController.signUserIn(context),
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
