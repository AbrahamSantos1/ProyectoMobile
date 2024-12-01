import 'dart:convert';
import 'package:control_salud_infantil/config/config.dart';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl;

  // Usa el baseUrl de Config por defecto
  AuthService({this.baseUrl = Config.baseUrl});

  // Método para iniciar sesión y guardar el ID del usuario
  Future<Usuario> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final usuario = Usuario.fromJson(responseData['usuario']);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userId', usuario.id!);

      return usuario;
    } else if (response.statusCode == 401) {
      throw Exception('Correo electrónico o contraseña incorrectos');
    } else {
      throw Exception('Error inesperado en el servidor');
    }
  }

  // Método para obtener el ID del usuario autenticado
  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId'); // Recupera el ID del usuario
  }

  // Método para cerrar sesión
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId'); // Elimina el ID del usuario almacenado
  }
}
