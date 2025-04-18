import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> canchas = [];
  List<dynamic> filteredCanchas = [];
  String selectedDeporte = "Todos";

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    final String response = await rootBundle.loadString('assets/db.json');
    final data = json.decode(response);
    setState(() {
      canchas = data["proveedores"];
      filteredCanchas = canchas;
    });
  }

  void filtrarCanchas(String deporte) {
    setState(() {
      selectedDeporte = deporte;
      filteredCanchas = deporte == "Todos"
          ? canchas
          : canchas.where((cancha) => cancha["deportes"].contains(deporte)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutApp"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Menú"),
            ),
            ListTile(
              title: Text("Opción 1"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedDeporte,
              items: ["Todos", "Fútbol", "Tenis", "Pádel"].map((deporte) {
                return DropdownMenuItem(
                  value: deporte,
                  child: Text(deporte),
                );
              }).toList(),
              onChanged: (value) => filtrarCanchas(value!),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCanchas.length,
              itemBuilder: (context, index) {
                final cancha = filteredCanchas[index];
                return ListTile(
                  leading: Image.network(cancha["imagenPerfil"], width: 50, height: 50),
                  title: Text(cancha["nombreProveedor"]),
                  subtitle: Text(cancha["ubicación"]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CanchaCardScreen(cancha: cancha),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
        ],
      ),
    );
  }
}
