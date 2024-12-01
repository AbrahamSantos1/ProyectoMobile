import 'package:control_salud_infantil/models/datos.dart';
import 'package:control_salud_infantil/service/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:control_salud_infantil/components/my_appointment.dart';
import 'package:control_salud_infantil/components/my_button.dart';
import 'package:control_salud_infantil/pages/home/home_controller.dart';
import 'package:control_salud_infantil/service/perfil_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController(
      perfilService: PerfilService(), authService: AuthService());
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    await controller.loadUserData(arguments, context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.black),
          onPressed: () => controller.logout(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildUserContent(),
    );
  }

  Widget _buildUserContent() {
    try {
      final Usuario usuario =
          controller.getUsuario() ?? Usuario();
      final List<CitaMedica> citas = usuario.citaMedica;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserHeader(usuario),
            const SizedBox(height: 20),
            const Text(
              'Próximas Citas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildAppointmentList(citas),
            const Spacer(),
            _buildBottomButtons(),
          ],
        ),
      );
    } catch (e) {
      return const Center(
        child: Text(
          'Error al cargar los datos del usuario.',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      );
    }
  }

  Widget _buildUserHeader(Usuario usuario) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.gotoEditPerfil(context),
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
              '${usuario.nombre ?? ''} ${usuario.apellidos ?? ''}'.trim(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('Bienvenido/a!'),
          ],
        ),
      ],
    );
  }

  Widget _buildAppointmentList(List<CitaMedica> citas) {
    return citas.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: citas.length,
              itemBuilder: (context, index) {
                final cita = citas[index];
                return Column(
                  children: [
                    AppointmentTile(
                      title: cita.especialidadDoctor ??
                          'Especialidad no disponible',
                      date: cita.dia ?? '',
                      time: cita.hora ?? '',
                      icon: Icons.calendar_month,
                      optionalText: 'Ver detalles',
                      onOptionalTextTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Detalles de la cita con ${cita.especialidadDoctor ?? 'Especialidad no disponible'}',
                            ),
                          ),
                        );
                      },
                    ),
                    if (index < citas.length - 1) const Divider(),
                  ],
                );
              },
            ),
          )
        : const Center(
            child: Text(
              'No hay citas disponibles',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
  }


  Widget _buildBottomButtons() {
    return Column(
      children: [
        MyButton(
          onTap: () => controller.editAppointment(context),
          text: 'Modificar Citas',
          colorBG: Colors.white,
          colorTxt: Colors.black,
          hasBorder: true,
        ),
        const SizedBox(height: 10),
        MyButton(
          onTap: () => controller.bookAppointment(context),
          text: 'Reservar nueva cita',
          colorBG: Colors.black,
          colorTxt: Colors.white,
        ),
      ],
    );
  }
}
