import 'package:flutter/material.dart';

class AppointmentTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final double? fontSizeTitle;
  final double? fontSizeSubTitle;
  final String? optionalText; // Texto opcional
  final VoidCallback? onOptionalTextTap; // Callback para el texto opcional

  const AppointmentTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.fontSizeTitle,
    this.fontSizeSubTitle,
    this.optionalText, // Agregar el parámetro opcional
    this.onOptionalTextTap, // Callback para el texto opcional
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.red),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(title, style: TextStyle(fontSize: fontSizeTitle)),
          ),
          if (optionalText != null) // Mostrar el texto opcional si no es null
            GestureDetector(
              onTap: onOptionalTextTap, // Llama al callback al tocar
              child: Text(
                optionalText!,
                style: TextStyle(
                    fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
      subtitle: Text(subtitle, style: TextStyle(fontSize: fontSizeSubTitle)),
    );
  }
}
