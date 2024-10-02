import 'package:flutter/material.dart';

class MySquareButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const MySquareButton({
    super.key,
    required this.icon,
    required this.label,
    this.color = Colors.blue, // Color por defecto
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Acción al presionar el botón
      child: Container(
        width: 80, // Ancho del botón
        height: 80, // Alto del botón
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2
          ),
          color: color, // Color de fondo del botón
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black), // Icono centrado
            const SizedBox(height: 4), // Espacio entre el icono y el texto
            Text(
              label,
              style: const TextStyle(color: Colors.black), // Texto centrado
            ),
          ],
        ),
      ),
    );
  }
}
