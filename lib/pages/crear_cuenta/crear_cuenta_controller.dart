import 'package:control_salud_infantil/service/crear_cuenta_service.dart';
import 'package:flutter/material.dart';

class CreateAccountController {
  final AccountService accountService;

  CreateAccountController({required this.accountService});

  Future<void> createAccount({
    required String nombre,
    required String email,
    required String password,
    required String passwordConfirmation,
    required BuildContext context,
  }) async {
    try {
      if (password != passwordConfirmation) {
        throw Exception('Las contraseñas no coinciden');
      }

      final response = await accountService.createAccount(
        nombre: nombre,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      if (response.containsKey('message') &&
          response['message'] == 'Cuenta creada exitosamente') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        throw Exception(response['message'] ?? 'Error al crear cuenta');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
