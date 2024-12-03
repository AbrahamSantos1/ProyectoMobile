import 'package:flutter/material.dart';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:control_salud_infantil/service/reservar_service.dart';

class ReservarController {
  final ReservarService reservarService = ReservarService();
  bool isLoading = false;

  String? selectedDoctor;
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  List<String> doctors = [];
  List<String> timeSlots = [
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM'
  ];
  List<Appointment> upcomingAppointments = [];

  Future<void> fetchDoctors() async {
    isLoading = true;
    try {
      doctors = await reservarService.fetchDoctors();
    } catch (e) {
      doctors = [];
    } finally {
      isLoading = false;
    }
  }

  Future<void> fetchAppointments() async {
    isLoading = true;
    try {
      upcomingAppointments = await reservarService.fetchAppointments();
    } catch (e) {
      upcomingAppointments = [];
    } finally {
      isLoading = false;
    }
  }

  void selectDoctor(String doctor) {
    selectedDoctor = doctor;
  }

  void selectDate(DateTime date) {
    selectedDate = date;
  }

  void selectTime(String time) {
    selectedTime = time;
  }

  Future<void> bookAppointment(BuildContext context) async {
    if (selectedDoctor != null && selectedTime != null) {
      try {
        await reservarService.bookAppointment(
          doctor: selectedDoctor!,
          date: selectedDate,
          time: selectedTime!,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cita reservada exitosamente')),
        );
        await fetchAppointments();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }
}
