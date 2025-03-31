import 'package:flutter/material.dart';
import 'package:flutter_application_2/proyecto%20v1.0/pag/widgetprueba.dart';

void main(){
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){    
    return  const MaterialApp(
      home: WidgetPrueba()
    );
  }
}