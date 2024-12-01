import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:control_salud_infantil/config/config.dart';

class AccountService {
  final String baseUrl = Config.baseUrl;

  Future<Map<String, dynamic>> createAccount({
    required String nombre,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final url = Uri.parse('$baseUrl/crear_cuenta');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombre,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al crear cuenta: ${response.body}');
    }
  }
}
