import 'package:flutter/material.dart';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:control_salud_infantil/service/reservar_service.dart';

class ReservarController with ChangeNotifier {
  final ReservarService _service = ReservarService();

  bool isLoading = false;
  Map<String, dynamic>? datosMedicos;
  List<dynamic> calendarioVacunas = [];
  String? errorMessage;

  Future<void> obtenerDatosMedicos(int usuarioId, int perfilPacienteId, int registroMedicoId) async {
    isLoading = true;
    notifyListeners();
    try {
      datosMedicos = await _service.fetchDatosMedicos(usuarioId, perfilPacienteId, registroMedicoId);
      if (datosMedicos == null) {
        errorMessage = 'No se encontraron datos médicos.';
      }
    } catch (e) {
      errorMessage = 'Error al obtener los datos médicos.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> obtenerCalendarioVacunas(int perfilPacienteId) async {
    isLoading = true;
    notifyListeners();
    try {
      calendarioVacunas = await _service.fetchCalendarioVacunas(perfilPacienteId);
    } catch (e) {
      errorMessage = 'Error al obtener el calendario de vacunas.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}