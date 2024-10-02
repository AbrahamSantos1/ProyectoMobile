import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});
// Controladores de texto
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  void createAccount() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear cuenta',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Eliminar la sombra predeterminada
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
                // Logo
                Row(
                  children: [
                    // Icono de lápiz dentro de un contenedor con decoración
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
                            color: Colors.black, // Color del texto
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ingresa tus datos para \n crear tu cuenta',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey, // Color del subtítulo
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

                // Usuario
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

                MyTextfield(
                  controller: repeatPasswordController,
                  hintText: 'Ingresa nuevamente tu contraseña',
                  obscureText: true,
                  validator: (value) => '',
                ),
                const SizedBox(height: 30),

                // Botón para crear cuenta
                MyButton(
                  onTap: createAccount,
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
