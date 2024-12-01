import 'dart:async';
import 'package:control_salud_infantil/models/datos.dart';
import 'package:control_salud_infantil/service/perfil_service.dart';
import 'package:control_salud_infantil/service/usuario_service.dart';
import 'package:flutter/material.dart';

class HomeController {
  Usuario? _usuario;
  final PerfilService perfilService;
  final AuthService authService;
  bool isLoggedOut = false; 

  HomeController({required this.perfilService, required this.authService});

  Future<void> loadUserData(dynamic arguments, BuildContext context) async {
    try {
      if (isLoggedOut) return; 

      if (arguments != null && arguments is Map<String, dynamic>) {
        setUsuarioFromArguments(arguments);
      } else {
        final userId = await getUserIdFromAuth();
        if (userId != null) {
          await fetchUsuario(userId.toString());
        } else {
          throw Exception('ID de usuario no encontrado');
        }
      }
    } catch (e) {
      if (!isLoggedOut) {
        debugPrint('Error al cargar datos del usuario: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los datos del usuario')),
        );
      }
    }
  }

  Future<void> fetchUsuario(String id) async {
    try {
      if (!isLoggedOut) {
        _usuario = await perfilService.fetchPerfil(id);
      }
    } catch (e) {
      debugPrint('Error en fetchUsuario: $e');
    }
  }

  void setUsuarioFromArguments(dynamic arguments) {
    if (arguments != null && arguments is Map<String, dynamic>) {
      _usuario = Usuario.fromJson(arguments);
    }
  }

  Future<int?> getUserIdFromAuth() async {
    return await authService.getUserId();
  }

  Usuario? getUsuario() {
    return _usuario;
  }

  void gotoEditPerfil(BuildContext context) {
    Navigator.pushNamed(context, '/editar_perfil', arguments: _usuario);
  }

  Future<void> logout(BuildContext context) async {
    isLoggedOut = true; 
    await authService.logout();
    Navigator.pushReplacementNamed(
        context, '/login'); 
  }

  void editAppointment(BuildContext context) {
    Navigator.pushNamed(context, '/modificar_citas', arguments: _usuario);
  }

  void bookAppointment(BuildContext context) {
    Navigator.pushNamed(context, '/reservar_cita');
  }

  List<CitaMedica> getCitas() {
    return _usuario?.citaMedica ?? [];
  }

  String getNombreCompleto() {
    return "${_usuario?.nombre ?? ''} ${_usuario?.apellidos ?? ''}".trim();
  }
}
