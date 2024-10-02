import 'dart:convert';
import 'package:flutter/services.dart'; // Import this for loading JSON
import 'package:control_salud_infantil/components/my_appointment.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/components/my_calendar.dart';
import 'package:control_salud_infantil/components/my_doctor_button.dart';
import 'package:control_salud_infantil/components/my_toggleswitch.dart';
import 'package:flutter/material.dart';
import 'package:control_salud_infantil/models/doctores.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  List<Doctor> doctors = [];

  @override
  void initState() {
    super.initState();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    final String response =
        await rootBundle.loadString('lib/json/doctores.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      doctors = data.map((doctor) => Doctor.fromJson(doctor)).toList();
    });
  }

  perfilDoctor(BuildContext context) {}
  seeAllTheAppointments(BuildContext context) {}
  professionalPerfil(BuildContext context, Doctor doctor) {
    Navigator.pushNamed(context, '/professional', arguments: doctor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reservar',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme:
            const IconThemeData(color: Colors.black), // For back arrow color
        elevation: 0, // Remove shadow
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleccionar Doctor',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Doctor Selection Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...doctors.take(3).map((doctor) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: DoctorButton(
                        name: doctor.nombre,
                        backgroundColor: Colors.grey[300],
                        onPressed: () => perfilDoctor(context),
                      ),
                    );
                  }),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      backgroundColor: Colors.grey[300],
                    ),
                    child: const Icon(Icons.more_horiz, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Elige a tu doctor preferido para la vacunación.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const MyCalendar(),
            const Divider(thickness: 0.5),
            const Row(
              children: [
                Text('Ends'),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: DoctorButton(name: '8:00'),
                ),
                MyToggleSwitch(),
              ],
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: () => {},
              text: 'Continuar',
              colorBG: Colors.black,
              colorTxt: Colors.white,
              fontSize: 16,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Proximas Citas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                DoctorButton(
                    name: 'Ver Todas las Citas',
                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                    onPressed: () => seeAllTheAppointments(context)),
              ],
            ),
            AppointmentTile(
              title: 'Cita de Vacunacion',
              subtitle: 'Fecha: 15 de junio 2021',
              icon: Icons.calendar_month,
              fontSizeTitle: 14,
              fontSizeSubTitle: 10,
              optionalText: 'Dr. Rodriguez',
              onOptionalTextTap: () => professionalPerfil(context, doctors[0]),
            ),
            const Divider(thickness: 0.5),
            // Pass the selected doctor to the professionalPerfil function
            AppointmentTile(
              title: 'Cita de Seguimiento',
              subtitle: 'Fecha: 30 de junio 2021',
              icon: Icons.calendar_month,
              fontSizeSubTitle: 10,
              fontSizeTitle: 14,
              optionalText: 'Dr. Perez',
              onOptionalTextTap: () => professionalPerfil(
                  context, doctors[1]), // Pass the appropriate doctor
            ),
          ],
        ),
      ),
    );
  }
}
