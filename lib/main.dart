import 'package:control_salud_infantil/pages/book_appointment_page.dart';
import 'package:control_salud_infantil/pages/crear_cuenta/create_account_page.dart';
import 'package:control_salud_infantil/pages/edit_perfil_page.dart';
import 'package:control_salud_infantil/pages/enter_code_page.dart';
import 'package:control_salud_infantil/pages/forgot_password_page.dart';
import 'package:control_salud_infantil/pages/home/home_page.dart';
import 'package:control_salud_infantil/pages/login/login_page.dart';
import 'package:control_salud_infantil/pages/my_data_page.dart';
import 'package:control_salud_infantil/pages/perfil_page.dart';
import 'package:control_salud_infantil/pages/professional_perfil_page.dart';
import 'package:control_salud_infantil/pages/restore_password_page.dart';
import 'package:control_salud_infantil/pages/reservar/reservar_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  Intl.defaultLocale = 'es'; 
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
        '/reservar': (context) => ReservarPage(
              usuarioId: 1, 
              perfilPacienteId: 1, 
              registroMedicoId: 1, 
            ),
        '/professional': (context) => const ProfessionalPerfil()
      },
    );
  }
}
