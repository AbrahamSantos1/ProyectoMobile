import 'package:control_salud_infantil/pages/book_appointment.dart';
import 'package:control_salud_infantil/pages/create_account_page.dart';
import 'package:control_salud_infantil/pages/edit_perfil_page.dart';
import 'package:control_salud_infantil/pages/enter_code.dart';
import 'package:control_salud_infantil/pages/forgot_password.dart';
import 'package:control_salud_infantil/pages/home_page.dart';
import 'package:control_salud_infantil/pages/login_page.dart';
import 'package:control_salud_infantil/pages/my_data.dart';
import 'package:control_salud_infantil/pages/perfil_page.dart';
import 'package:control_salud_infantil/pages/professional_perfil.dart';
import 'package:control_salud_infantil/pages/restore_password.dart';
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
        '/login': (context) => LoginPage(),
        '/create_account': (context) => CreateAccountPage(),
        '/forgot_pass': (context) => ForgotPassword(),
        '/enter_code': (context) => EnterCode(),
        '/restore_pass': (context) => RestorePassword(),
        '/home': (context) => const HomePage(),
        '/my_data': (context) => const MyData(),
        '/perfil': (context) => const PerfilPage(),
        '/edit_perfil': (context) => EditPerfilPage(),
        '/reservar': (context) => const BookAppointment(),
        '/professional': (context) => const ProfessionalPerfil()
      },
    );
  }
}
