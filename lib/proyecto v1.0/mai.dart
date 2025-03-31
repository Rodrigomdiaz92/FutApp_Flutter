import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App Ficticia',
      theme: ThemeData(
        useMaterial3: true, // Activar Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Índice actual del BottomAppBar

  // Lista de widgets de cuerpo según la opción seleccionada
  final List<Widget> _pages = [
    Center(child: Text('Bienvenido a Home', style: TextStyle(fontSize: 20))),
    Center(child: Text('Buscar algo interesante', style: TextStyle(fontSize: 20))),
    Center(child: Text('Tus favoritos aparecerán aquí', style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Nombre de la App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white), // Ícono de menú hamburguesa
            onPressed: () => Scaffold.of(context).openDrawer(), // Abre el Drawer
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white), // Ícono de notificaciones
            onPressed: () {
              // Acción al presionar el ícono de notificaciones
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Notificaciones'),
                  content: Text('No tienes notificaciones nuevas.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/user_avatar.png'), // Reemplaza con tu imagen
                  ),
                  SizedBox(height: 10),
                  Text('Hola, Usuario',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('usuario@email.com',
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mi cuenta'),
              onTap: () {
                Navigator.pop(context);
                // Acción para "Mi cuenta"
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Próximos turnos'),
              onTap: () {
                Navigator.pop(context);
                // Acción para "Próximos turnos"
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Visita el centro de ayuda'),
              onTap: () {
                Navigator.pop(context);
                // Acción para "Centro de ayuda"
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context);
                // Acción para "Cerrar sesión"
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
      ),
    );
  }
}
