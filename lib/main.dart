import 'package:control_salud_infantil/pages/book_appointment.dart';
import 'package:control_salud_infantil/pages/create_account_page.dart';
import 'package:control_salud_infantil/pages/edit_perfil_page.dart';
import 'package:control_salud_infantil/pages/home_page.dart';
import 'package:control_salud_infantil/pages/login_page.dart';
import 'package:control_salud_infantil/pages/perfil_page.dart';
import 'package:control_salud_infantil/pages/professional_perfil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login':(context) => LoginPage(),
        '/create_account':(context) => CreateAccountPage(),
        '/home':(context) => const HomePage(),
        '/perfil': (context) => const PerfilPage(),
        '/edit_perfil': (context) => EditPerfilPage(),
        '/reservar': (context) => const BookAppointment(),
        '/professional': (context) => const ProfessionalPerfil()
      },
    );
  }
}

