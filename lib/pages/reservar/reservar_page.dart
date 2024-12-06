import 'package:flutter/material.dart';
import 'package:control_salud_infantil//pages/reservar/reservar_controller.dart';
import 'package:control_salud_infantil/components/my_calendar.dart';  // Importa tu widget personalizado

class ReservarPage extends StatefulWidget {
  const ReservarPage({Key? key}) : super(key: key);

  @override
  State<ReservarPage> createState() => _ReservarPageState();
}

class _ReservarPageState extends State<ReservarPage> {
  late ReservarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ReservarController();
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.fetchDoctors();
    await _controller.fetchAppointments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Seleccionar Doctor',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _controller.doctors
                          .map((doctor) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ChoiceChip(
                                  label: Text(doctor),
                                  selected: _controller.selectedDoctor == doctor,
                                  onSelected: (selected) {
                                    setState(() {
                                      _controller.selectDoctor(doctor);
                                    });
                                  },
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Elige una fecha',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Reemplazamos CalendarDatePicker con MyCalendar
                  MyCalendar(
                    onDateSelected: (selectedDate) {
                      setState(() {
                        _controller.selectDate(selectedDate);
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Hora de inicio'),
                      DropdownButton<String>(
                        value: _controller.selectedTime,
                        items: _controller.timeSlots
                            .map((time) => DropdownMenuItem(
                                  value: time,
                                  child: Text(time),
                                ))
                            .toList(),
                        onChanged: (time) {
                          setState(() {
                            _controller.selectTime(time!);
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await _controller.bookAppointment(context);
                      setState(() {});
                    },
                    child: const Text('Continuar'),
                  ),
                  const Divider(),
                  const Text(
                    'Próximas Citas',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _controller.upcomingAppointments.length,
                      itemBuilder: (context, index) {
                        final cita = _controller.upcomingAppointments[index];
                        return ListTile(
                          leading: Icon(Icons.calendar_today,
                              color: Theme.of(context).primaryColor),
                          title: Text(cita.titulo),
                          subtitle: Text('Fecha: ${cita.fecha}'),
                          trailing: Text(cita.doctor),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
