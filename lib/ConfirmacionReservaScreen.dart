import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Asegurate de tener lottie en pubspec.yaml

class ConfirmacionReservaScreen extends StatelessWidget {
  const ConfirmacionReservaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reserva Confirmada"),
        automaticallyImplyLeading: false, // Evita mostrar botón de retroceso
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Animación con Lottie (o un ícono si no usás Lottie)
              Lottie.asset(
                'assets/check_success.json',
                width: 150,
                repeat: false,
              ),
              const SizedBox(height: 30),
              const Text(
                "¡Reserva confirmada!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text("📍 Cancha: Fútbol 7 - Club El Golazo"),
              const Text("📆 Fecha: 15 de mayo 2025"),
              const Text("⏰ Horario: 20:00 - 21:00"),
              const Text("💵 Estado: Confirmado"),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: const Text("Volver al inicio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
