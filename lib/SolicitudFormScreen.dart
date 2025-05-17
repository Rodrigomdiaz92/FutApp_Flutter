import 'package:flutter/material.dart';

class SolicitudFormScreen extends StatefulWidget {
  const SolicitudFormScreen({Key? key}) : super(key: key);

  @override
  SolicitudFormScreenState createState() => SolicitudFormScreenState();
}

class SolicitudFormScreenState extends State<SolicitudFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _nombre;
  String? _email;
  String? _celular;
  String? _deporte;
  String? _tipoCancha;
  TimeOfDay? _hora;

  final List<String> _deportes = ['Fútbol', 'Tenis', 'Pádel'];
  final List<String> _tiposCancha = ['5', '7', '9', '11'];

  Future<void> _seleccionarHora(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 0),
      helpText: 'Seleccioná horario de partido',
    );
    if (picked != null && picked.hour >= 9 && picked.hour <= 23) {
      setState(() {
        _hora = picked;
      });
    }
  }

  void _enviarFormulario() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Solicitud enviada'),
        content: Text('Tu solicitud fue enviada. En breve recibirás una respuesta.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el popup
              Navigator.of(context).pop(); // Vuelve al home
            },
            child: Text('Volver al inicio'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitud de Cancha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre completo'),
                onSaved: (value) => _nombre = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Celular'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => _celular = value,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Deporte'),
                items: _deportes
                    .map((deporte) => DropdownMenuItem(
                          value: deporte,
                          child: Text(deporte),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _deporte = value;
                    _tipoCancha = null;
                  });
                },
              ),
              if (_deporte == 'Fútbol')
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Tipo de cancha'),
                  items: _tiposCancha
                      .map((tipo) => DropdownMenuItem(
                            value: tipo,
                            child: Text('Cancha de $tipo'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _tipoCancha = value;
                    });
                  },
                ),
              SizedBox(height: 16),
              ListTile(
                title: Text(_hora != null
                    ? 'Horario seleccionado: ${_hora!.format(context)}'
                    : 'Seleccioná un horario'),
                trailing: Icon(Icons.access_time),
                onTap: () => _seleccionarHora(context),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: //_enviarFormulario,
                () {
                  //Navigator.pushNamed(context, SeleccionHorarioScreen(cancha: cancha));
                  Navigator.pushNamed(context, '/confirmacion');
                },
                child: Text('Enviar solicitud'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
