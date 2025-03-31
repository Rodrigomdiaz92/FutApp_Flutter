import 'package:flutter/material.dart';
//import 'package:flutter_application_2/seleccion.dart';

class CanchaCardScreen extends StatelessWidget {
  final Map<String, dynamic> cancha;

  const CanchaCardScreen({Key? key, required this.cancha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cancha['nombreProveedor']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(cancha['imagenPerfil'], height: 150, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(cancha['nombreProveedor'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(cancha['ubicación'], style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 10),
            Text("Horarios: ${cancha['horarios']}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Descripción: ${cancha['descripción']}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, SeleccionHorarioScreen(cancha: cancha));
                },
                child: Text("Seleccionar día y horario"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

