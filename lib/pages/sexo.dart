import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GenderPredictionTab extends StatefulWidget {
  const GenderPredictionTab({super.key});

  @override
  _GenderTabState createState() => _GenderTabState();
}

class _GenderTabState extends State<GenderPredictionTab> {
  String _name = '';
  String _gender = '';
  String _genderES = '';

  bool _showInfo = false; // Nuevo estado para controlar la visibilidad

  void _predictGender(String name) async {
    final uri = Uri.parse(
        'https://api.genderize.io/?name=$name'); // Convierte la cadena en un objeto Uri
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _gender = data['gender'] ?? 'Desconocido';
        
        if (_gender == 'male') {
          _genderES = 'Masculino';
        } else {
          _genderES = 'Femenino';
        }
        _showInfo = true; // Mostrar información después de la predicción
      });
    } else {
      setState(() {
        _gender = 'Error al obtener el género';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _predictGender(_name);
          },
          child: const Text('Predecir Género'),
        ),
        const SizedBox(height: 20),
        if (_showInfo) // Mostrar información solo si _showInfo es verdadero
          Column(
            children: [
              Text(
                'Género: $_genderES',
                style: TextStyle(
                  fontSize: 24,
                  color: _gender.toLowerCase() == 'male'
                      ? Colors.blue
                      : const Color.fromARGB(255, 225, 21, 208),
                ),
              ),
              Image.asset(
                _gender.toLowerCase() == 'male'
                    ? 'assets/images/niño.jpeg'
                    : 'assets/images/niña.jpg',
                height: 150,
              ),
            ],
          ),
      ],
    );
  }
}
