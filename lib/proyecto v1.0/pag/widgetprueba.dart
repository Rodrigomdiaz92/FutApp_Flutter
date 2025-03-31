import 'package:flutter/material.dart';



class WidgetPrueba extends StatelessWidget{
  const WidgetPrueba({super.key});

  @override
  Widget build(BuildContext context){    
    return const Scaffold(
        body: Center(
          child: Text("Soy un texto"),
          ),
      );
  }
}