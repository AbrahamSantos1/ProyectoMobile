import 'package:control_salud_infantil/pages/crear_cuenta/crear_cuenta_controller.dart';
import 'package:control_salud_infantil/service/crear_cuenta_service.dart';
import 'package:flutter/material.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  final CreateAccountController controller =
      CreateAccountController(accountService: AccountService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear cuenta',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: FloatingActionButton(
                          onPressed: null,
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nuevo Usuario',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ingresa tus datos para \n crear tu cuenta',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Nombre',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                MyTextfield(
                  controller: usernameController,
                  hintText: 'Ingresa tu nombre',
                  obscureText: false,
                  validator: (value) => '',
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Correo electrónico',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Ingresa tu correo electrónico',
                  obscureText: false,
                  validator: (value) => '',
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Contraseña',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Ingresa tu contraseña',
                  obscureText: true,
                  validator: (value) => '',
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  controller: repeatPasswordController,
                  hintText: 'Ingresa nuevamente tu contraseña',
                  obscureText: true,
                  validator: (value) => '',
                ),
                const SizedBox(height: 30),
                MyButton(
                  onTap: () {
                    controller.createAccount(
                      nombre: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      passwordConfirmation: repeatPasswordController.text,
                      context: context,
                    );
                  },
                  text: 'Crear cuenta',
                  colorBG: Colors.black,
                  colorTxt: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
