import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:control_salud_infantil/config/config.dart';
import 'package:control_salud_infantil/models/datos.dart';
class ReservarService {
  static const String baseUrl = "http://10.0.2.2:9292";

  Future<Map<String, dynamic>?> fetchDatosMedicos(int usuarioId, int perfilPacienteId, int registroMedicoId) async {
    final url = Uri.parse('$baseUrl/datos_medicos/$usuarioId/$perfilPacienteId/$registroMedicoId');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null; // Manejo de error según respuesta de API
    }
  }

  Future<List<dynamic>> fetchCalendarioVacunas(int perfilPacienteId) async {
    final url = Uri.parse('$baseUrl/calendario_vacunas/$perfilPacienteId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener el calendario de vacunas');
    }
  }
}
