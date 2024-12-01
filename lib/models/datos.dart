class Usuario {
  final int? id;
  final String? nombre;
  final String? apellidos;
  final String? email;
  final String? contrasena;
  final List<CitaMedica> citaMedica;

  Usuario({
    this.id,
    this.nombre,
    this.apellidos,
    this.email,
    this.contrasena,
    this.citaMedica = const [],
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] as int?,
      nombre: json['nombre'] as String?,
      apellidos: json['apellidos'] as String?,
      email: json['email'] as String?,
      contrasena: json['contrasena'] as String?,
      citaMedica: (json['citas_proximas'] as List<dynamic>?)
              ?.map((e) => CitaMedica.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class CitaMedica {
  final String? especialidadDoctor;
  final String? dia;
  final String? hora;
  final String? nombreClinica;
  final Doctor? doctor;

  CitaMedica({
    this.especialidadDoctor,
    this.dia,
    this.hora,
    this.nombreClinica,
    this.doctor,
  });

  factory CitaMedica.fromJson(Map<String, dynamic> json) {
    return CitaMedica(
      especialidadDoctor: json['especialidad_doctor'] as String?,
      dia: json['fecha_cita'] as String?,
      hora: json['hora_cita'] as String?,
      nombreClinica: json['nombre_clinica'] as String?,
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
    );
  }
}

class Doctor {
  final String? nombreCompleto;
  final String? universidad;
  final List<Resena> resenas;
  final UbicacionClinica? ubicacionClinica;

  Doctor({
    this.nombreCompleto,
    this.universidad,
    this.resenas = const [],
    this.ubicacionClinica,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      nombreCompleto: json['nombre_completo'] as String?,
      universidad: json['universidad'] as String?,
      resenas: (json['resenas'] as List<dynamic>?)
              ?.map((i) => Resena.fromJson(i))
              .toList() ??
          [],
      ubicacionClinica: json['ubicacion_clinica'] != null
          ? UbicacionClinica.fromJson(json['ubicacion_clinica'])
          : null,
    );
  }
}

class Resena {
  final String? cliente;
  final String? comentario;

  Resena({
    this.cliente,
    this.comentario,
  });

  factory Resena.fromJson(Map<String, dynamic> json) {
    return Resena(
      cliente: json['cliente'] as String?,
      comentario: json['comentario'] as String?,
    );
  }
}

class UbicacionClinica {
  final double? latitud;
  final double? longitud;
  final String? direccion;

  UbicacionClinica({
    this.latitud,
    this.longitud,
    this.direccion,
  });

  factory UbicacionClinica.fromJson(Map<String, dynamic> json) {
    return UbicacionClinica(
      latitud: (json['latitud'] as num?)?.toDouble(),
      longitud: (json['longitud'] as num?)?.toDouble(),
      direccion: json['direccion'] as String?,
    );
  }
}
