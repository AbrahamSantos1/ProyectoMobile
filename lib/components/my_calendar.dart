import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // Importa intl para formatear la fecha.

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  MyCalendarState createState() => MyCalendarState();
}

class MyCalendarState extends State<MyCalendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(today);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Día Seleccionado = $formattedDate",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TableCalendar(
          locale: "en_US",
          focusedDay: today,
          headerStyle: const HeaderStyle(formatButtonVisible: false),
          availableGestures: AvailableGestures.all,
          firstDay: DateTime.utc(2023, 3, 14),
          lastDay: DateTime.utc(2025, 10, 23),
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: _onDaySelected,
        ),
      ],
    );
  }
}
