class Usuario {
  final String nombre;
  final String correo;
  final String contrasena;
  final CitaMedica citaMedica;

  Usuario({required this.nombre, required this.correo, required this.contrasena, required this.citaMedica});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json['nombre'],
      correo: json['correo'],
      contrasena: json['contrasena'],
      citaMedica: CitaMedica.fromJson(json['cita_medica']),
    );
  }
}

class CitaMedica {
  final String especialidadDoctor;
  final String dia;
  final String hora;
  final Doctor doctor;

  CitaMedica({required this.especialidadDoctor, required this.dia, required this.hora, required this.doctor});

  factory CitaMedica.fromJson(Map<String, dynamic> json) {
    return CitaMedica(
      especialidadDoctor: json['especialidad_doctor'],
      dia: json['dia'],
      hora: json['hora'],
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}

class Doctor {
  final String nombreCompleto;
  final String universidad;
  final List<Resena> resenas;
  final UbicacionClinica ubicacionClinica;

  Doctor({required this.nombreCompleto, required this.universidad, required this.resenas, required this.ubicacionClinica});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    var list = json['resenas'] as List;
    List<Resena> resenasList = list.map((i) => Resena.fromJson(i)).toList();

    return Doctor(
      nombreCompleto: json['nombre_completo'],
      universidad: json['universidad'],
      resenas: resenasList,
      ubicacionClinica: UbicacionClinica.fromJson(json['ubicacion_clinica']),
    );
  }
}

class Resena {
  final String cliente;
  final String comentario;

  Resena({required this.cliente, required this.comentario});

  factory Resena.fromJson(Map<String, dynamic> json) {
    return Resena(
      cliente: json['cliente'],
      comentario: json['comentario'],
    );
  }
}

class UbicacionClinica {
  final double latitud;
  final double longitud;
  final String direccion;

  UbicacionClinica({required this.latitud, required this.longitud, required this.direccion});

  factory UbicacionClinica.fromJson(Map<String, dynamic> json) {
    return UbicacionClinica(
      latitud: json['latitud'],
      longitud: json['longitud'],
      direccion: json['direccion'],
    );
  }
}
