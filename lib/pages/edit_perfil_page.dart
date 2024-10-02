import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_textfield.dart';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:flutter/material.dart';

class EditPerfilPage extends StatelessWidget {
  EditPerfilPage({super.key});
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  guardar() {}
  @override
  Widget build(BuildContext context) {
    
    final Usuario usuario =
        ModalRoute.of(context)!.settings.arguments as Usuario;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modificar Perfil',
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
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          usuario.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text('Editar perfil'),
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
                  hintText: usuario.nombre,
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
                  hintText: usuario.correo,
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
                  hintText: usuario.contrasena,
                  obscureText: true,
                  validator: (value) => '',
                ),

                MyTextfield(
                  controller: repeatPasswordController,
                  hintText: usuario.contrasena,
                  obscureText: true,
                  validator: (value) => '',
                ),
                const SizedBox(height: 30),

                // Botón para crear cuenta
                MyButton(
                  onTap: guardar,
                  text: 'Guardar',
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
