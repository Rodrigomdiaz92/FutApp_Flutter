import 'package:flutter/material.dart';

class SeleccionHorarioScreen extends StatefulWidget {
  final Map<String, dynamic> cancha;

  const SeleccionHorarioScreen({Key? key, required this.cancha}) : super(key: key);

  @override
  _SeleccionHorarioScreenState createState() => _SeleccionHorarioScreenState();
}

class _SeleccionHorarioScreenState extends State<SeleccionHorarioScreen> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seleccionar Día y Horario")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Seleccione una fecha:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
              child: Text("${selectedDate.toLocal()}".split(' ')[0]),
            ),
            SizedBox(height: 20),
            Text("Seleccione un horario disponible:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: widget.cancha['horariosDisponibles'].map<Widget>((horario) {
                return ChoiceChip(
                  label: Text(horario),
                  selected: selectedTime == horario,
                  onSelected: (selected) {
                    setState(() {
                      selectedTime = selected ? horario : null;
                    });
                  },
                );
              }).toList(),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: selectedTime != null
                    ? () {
                        Navigator.pop(context);
                      }
                    : null,
                child: Text("Confirmar Reserva"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
