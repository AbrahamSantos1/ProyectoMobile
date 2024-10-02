import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color colorBG;
  final Color colorTxt;
  final bool hasBorder;
  final double? fontSize;
  final double? widthButton;
  final double? heightButton;
  final Color? borderColor; // Color del borde, opcional
  final Icon? icon; // Icono opcional
  final Color? iconColor; // Color del icono opcional

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.colorBG,
    required this.colorTxt,
    this.hasBorder = false,
    this.fontSize,
    this.widthButton,
    this.heightButton,
    this.borderColor,
    this.icon,
    this.iconColor, // Agregar el parámetro del color del icono
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthButton, // Establecer el ancho del botón
        height: heightButton, // Establecer la altura del botón
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: colorBG,
          borderRadius: BorderRadius.circular(8),
          border: hasBorder
              ? Border.all(
                  color: borderColor ??
                      Colors.black) // Usar borderColor si está presente
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido
          children: [
            if (icon != null) ...[
              Icon(
                icon!.icon, // Usar el icono proporcionado
                color: iconColor ??
                    Colors.black, // Usar iconColor si está presente
              ),
              const SizedBox(width: 8), // Espacio entre el icono y el texto
            ],
            Text(
              text,
              style: TextStyle(
                color: colorTxt,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
