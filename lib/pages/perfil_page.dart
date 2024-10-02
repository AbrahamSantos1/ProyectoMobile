import 'package:control_salud_infantil/components/my_perfil_options.dart';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  modificarperfil(BuildContext context, Usuario usuario) {
    Navigator.pushNamed(context, '/edit_perfil', arguments: usuario);
  }

  logout(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
     final Usuario usuario =
        ModalRoute.of(context)!.settings.arguments as Usuario;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Eliminar la sombra predeterminada
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
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
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
                    const Text('Detalles del perfil'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Opciones de Perfil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Appointment list
            MyPerfilOptions(
              title: 'Ver Perfil',
              color: Colors.blue[300]!,
              iconData: Icons.person,
            ),
            const Divider(),
            MyPerfilOptions(
              title: 'Modificar Perfil',
              color: Colors.grey,
              iconData: Icons.settings,
              onTap: () => modificarperfil(context, usuario),
            ),
            const Divider(),
            MyPerfilOptions(
              title: 'Cerrar Sesion',
              color: Colors.brown,
              iconData: Icons.door_back_door,
              onTap: () => logout(context),
            ),
            const Spacer(),
            // Buttons at the bottom
          ],
        ),
      ),
    );
  }
}
