import 'package:flutter/material.dart';

class DoctorButton extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;
  final Color? backgroundColor; // Ahora opcional
  final Color? borderColor; // Color de borde opcional

  // Constructor para pasar el nombre y la acción del doctor
  const DoctorButton({
    super.key,
    required this.name,
    this.onPressed,
    this.backgroundColor, // Permitir pasar un color
    this.borderColor, // Color de borde opcional
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        backgroundColor: backgroundColor ??
            Colors.white, // Establecer blanco como valor predeterminado
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                  width: 2, // Agregar el borde si el color no es nulo
                )
              : BorderSide.none, // Sin borde si el color es nulo
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
