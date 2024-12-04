import 'package:flutter/material.dart';
import 'dart:math';

class Distancia extends StatefulWidget {
  @override
  _DistanciaPageState createState() => _DistanciaPageState();
}

class _DistanciaPageState extends State<Distancia> {
  final _formKey = GlobalKey<FormState>();
  final _x1Controller = TextEditingController();
  final _y1Controller = TextEditingController();
  final _x2Controller = TextEditingController();
  final _y2Controller = TextEditingController();

  final distancia_controller _distanciaController = distancia_controller();
  String _resultado = "";

  void _calcularDistancia() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _resultado = _distanciaController.obtenerDistancia(
          _x1Controller.text,
          _y1Controller.text,
          _x2Controller.text,
          _y2Controller.text,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cálculo de Distancia Euclidiana',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ingrese las coordenadas:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: _x1Controller,
                label: 'Punto 1: x1',
              ),
              _buildTextField(
                controller: _y1Controller,
                label: 'Punto 1: y1',
              ),
              _buildTextField(
                controller: _x2Controller,
                label: 'Punto 2: x2',
              ),
              _buildTextField(
                controller: _y2Controller,
                label: 'Punto 2: y2',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularDistancia,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.deepPurple),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingrese un valor';
        }
        return null;
      },
    );
  }
}

class distancia_controller {
  String obtenerDistancia(String x1, String y1, String x2, String y2) {
    try {
      double x1Val = double.parse(x1);
      double y1Val = double.parse(y1);
      double x2Val = double.parse(x2);
      double y2Val = double.parse(y2);

      double distancia = sqrt(pow(x2Val - x1Val, 2) + pow(y2Val - y1Val, 2));
      return "Distancia: ${distancia.toStringAsFixed(2)}";
    } catch (e) {
      return "Error: Entrada inválida";
    }
  }
}
