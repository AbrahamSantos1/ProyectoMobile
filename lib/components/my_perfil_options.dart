import 'package:flutter/material.dart';

class MyPerfilOptions extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData iconData;
  final Color color;
  final VoidCallback? onTap; 

  const MyPerfilOptions({
    super.key,
    required this.title,
    this.subtitle, 
    required this.iconData,
    required this.color,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(iconData, color: color),
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap, // Asigna la función onTap aquí
    );
  }
}
