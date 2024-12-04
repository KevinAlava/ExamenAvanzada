import 'package:flutter/material.dart';
import 'interfaz/bienvenida.dart';
import 'interfaz/distancia.dart';

void main() => runApp(DistanciaAplicacion());

class DistanciaAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distancias',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/bienvenida', // Pantalla inicial
      routes: {
        '/bienvenida': (context) => Bienvenida(),
        '/distancia': (context) => Distancia(),
      },
    );
  }
}




