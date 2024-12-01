import 'dart:convert';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:http/http.dart' as http;
import 'package:control_salud_infantil/config/config.dart';


class PerfilService {
  final String baseUrl;

  PerfilService({this.baseUrl = Config.baseUrl});

  Future<Usuario> fetchPerfil(String id) async {
    final url = Uri.parse('$baseUrl/perfil/$id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return Usuario.fromJson(responseData);
      } else {
        throw Exception('Error al obtener los datos del perfil');
      }
    } catch (e) {
      throw Exception('Error en fetchPerfil: $e');
    }
  }
}
