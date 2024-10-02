class Direccion {
  final String calle;
  final int numero;
  final String ciudad;
  final String pais;

  Direccion({
    required this.calle,
    required this.numero,
    required this.ciudad,
    required this.pais,
  });

  factory Direccion.fromJson(Map<String, dynamic> json) {
    return Direccion(
      calle: json['calle'],
      numero: json['numero'],
      ciudad: json['ciudad'],
      pais: json['pais'],
    );
  }
}


class Doctor {
  final String nombre;
  final String especialidad;
  final int edad;
  final String telefono;
  final String email;
  final int experiencia;
  final String hospital;
  final Direccion direccion;

  Doctor({
    required this.nombre,
    required this.especialidad,
    required this.edad,
    required this.telefono,
    required this.email,
    required this.experiencia,
    required this.hospital,
    required this.direccion,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      nombre: json['nombre'],
      especialidad: json['especialidad'],
      edad: json['edad'],
      telefono: json['telefono'],
      email: json['email'],
      experiencia: json['experiencia'],
      hospital: json['hospital'],
      direccion: Direccion.fromJson(json['direccion']),
    );
  }
}
