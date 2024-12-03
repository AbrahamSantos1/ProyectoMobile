import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:control_salud_infantil/config/config.dart';
import 'package:control_salud_infantil/models/datos.dart';

class ReservarService {
  final String baseUrl = Config.baseUrl;

  Future<List<String>> fetchDoctors() async {
    final url = Uri.parse('$baseUrl/doctores');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((doctor) => doctor['nombre'] as String).toList();
    } else {
      throw Exception('Error al obtener doctores: ${response.body}');
    }
  }

  Future<List<Appointment>> fetchAppointments() async {
    final url = Uri.parse('$baseUrl/citas');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((cita) => Appointment(
                titulo: cita['titulo'],
                fecha: cita['fecha'],
                doctor: cita['doctor'],
              ))
          .toList();
    } else {
      throw Exception('Error al obtener citas: ${response.body}');
    }
  }

  Future<void> bookAppointment({
    required String doctor,
    required DateTime date,
    required String time,
  }) async {
    final url = Uri.parse('$baseUrl/reservar');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'doctor': doctor,
        'fecha': '${date.year}-${date.month}-${date.day}',
        'hora': time,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al reservar cita: ${response.body}');
    }
  }
}
