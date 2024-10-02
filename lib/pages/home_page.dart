import 'package:control_salud_infantil/components/my_appointment.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  bookAppointment(BuildContext context, Usuario usuario) {
    Navigator.pushNamed(context, '/reservar', arguments: usuario);
  }

  editAppointment(BuildContext context) {}
  logout(BuildContext context) {
    Navigator.pop(context);
  }

  gotoeditperfil(BuildContext context, Usuario usuario) {
    Navigator.pushNamed(context, '/perfil', arguments: usuario);
  }


  @override
  Widget build(BuildContext context) {
    final Usuario usuario =
        ModalRoute.of(context)!.settings.arguments as Usuario;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.black),
          onPressed: () => logout(context),
        ),
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User information section
            Row(
              children: [
                GestureDetector(
                  onTap: () => gotoeditperfil(context, usuario),
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usuario.nombre,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('Bienvenido!'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Próximas Citas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Appointment list
            AppointmentTile(
              title: usuario.citaMedica.especialidadDoctor,
              subtitle: '${usuario.citaMedica.dia}, ${usuario.citaMedica.hora}',
              icon: Icons.calendar_month,
            ),
            const Divider(),
            const AppointmentTile(
              title: 'Doctors Checkup',
              subtitle: 'Monday, 2:00 PM',
              icon: Icons.calendar_today,
            ),
            const Divider(),
            const AppointmentTile(
              title: 'Doctors Checkup',
              subtitle: 'Monday, 2:00 PM',
              icon: Icons.calendar_today,
            ),
            const Spacer(),
            // Buttons at the bottom
            Column(
              children: [
                MyButton(
                  onTap: () => editAppointment(context),
                  text: 'Modificar Citas',
                  colorBG: Colors.white,
                  colorTxt: Colors.black,
                  hasBorder: true,
                ),
                const SizedBox(height: 10), // Espacio entre los botones
                MyButton(
                  onTap: () => bookAppointment(context, usuario),
                  text: 'Reservar nueva cita',
                  colorBG: Colors.black,
                  colorTxt: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
