import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

Future<void> cargarDatos() async {
  try {
    final String response = await rootBundle.loadString('assets/db.json');
    final data = json.decode(response);

    if (data != null && data["proveedores"] != null) {
      print("Datos cargados correctamente:");
      //print(jsonEncode(data["proveedores"])); // Imprime solo el array de proveedores
    } else {
      print("Error: El JSON no contiene el array 'proveedores'.");
    }
  } catch (e) {
    print("Error al cargar el archivo JSON: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Bienvenido',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
