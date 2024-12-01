import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppointmentTile extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final IconData icon;
  final double? fontSizeTitle;
  final double? fontSizeSubTitle;
  final String? optionalText;
  final VoidCallback? onOptionalTextTap;

  const AppointmentTile({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.icon,
    this.fontSizeTitle,
    this.fontSizeSubTitle,
    this.optionalText,
    this.onOptionalTextTap,
  });

  
  String _formatDateTime(String date, String time) {
    try {
      String cleanTime = time.contains('.') ? time.split('.').first : time;

      if (time.contains('-')) {
        date = time.split(' ').first; 
        cleanTime = time.split(' ')[1]; 
      }

      String dateTimeString = '$date $cleanTime';

      DateTime dateTime = DateTime.parse(dateTimeString);

      return DateFormat('EEEE, hh:mm a', 'es').format(dateTime);
    } catch (e) {
      debugPrint('Error al formatear fecha y hora: $e\nEntrada: $date $time');
      return 'Fecha no disponible';
    }
  }



  @override
  Widget build(BuildContext context) {
    // Formatear fecha y hora
    final formattedDateTime = _formatDateTime(date, time);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.red),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSizeTitle ?? 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (optionalText != null)
            GestureDetector(
              onTap: onOptionalTextTap,
              child: Text(
                optionalText!,
                style: TextStyle(
                  fontSize: fontSizeTitle ?? 14.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
      subtitle: Text(
        formattedDateTime,
        style: TextStyle(
          fontSize: fontSizeSubTitle ?? 14.0,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
