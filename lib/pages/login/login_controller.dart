// ignore_for_file: use_build_context_synchronously

import 'package:control_salud_infantil/models/datos.dart';
import 'package:control_salud_infantil/service/usuario_service.dart';
import 'package:flutter/material.dart';

class SignInController {
  final AuthService authService = AuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUserIn(BuildContext context) async {
    final email = usernameController.text;
    final password = passwordController.text;

    try {
      final Usuario usuario = await authService.login(email, password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bienvenido/a, ${usuario.nombre}!')),
      );

      Navigator.pushNamed(context, '/home', arguments: usuario);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void createAccount(BuildContext context) {
    Navigator.pushNamed(context, '/create_account');
  }

  void forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot_password');
  }
}
