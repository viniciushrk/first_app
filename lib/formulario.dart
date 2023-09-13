import 'dart:ffi';

import 'package:flutter/material.dart';

class Formularinho extends StatefulWidget {
  const Formularinho({super.key});

  @override
  State<Formularinho> createState() => _FormularinhoState();
}

class _FormularinhoState extends State<Formularinho> {
  final double _sizeBoxHeight = 20;

  final TextEditingController _celsiusController = TextEditingController();
  final TextEditingController _fahrenheitController = TextEditingController();
  final TextEditingController _kelvinController = TextEditingController();

  void _Calcular() {
    var textCelsius = _celsiusController.text;
    var textFahrenheit = _fahrenheitController.text;
    var textKelvin = _kelvinController.text;

    if (textCelsius.isNotEmpty && converteDouble(textCelsius) != null) {
      double _celsius = double.parse(_celsiusController.text);
      double _fahrenheit = (_celsius*1.8) + 32;
      double _kelvin = _celsius + 273;

      _fahrenheitController.text = _fahrenheit.toString();
      _kelvinController.text = _kelvin.toString();

    } else if (textFahrenheit.isNotEmpty && converteDouble(textFahrenheit) != null) {
      double _fahrenheit = double.parse(_fahrenheitController.text);
      double _celsius = (_fahrenheit - 32) / 1.8;
      double _kelvin = (_fahrenheit - 32) * 5 / 9 + 273;

      _celsiusController.text = _celsius.toString();
      _kelvinController.text = _kelvin.toString();
    } else if (textKelvin.isNotEmpty && converteDouble(textKelvin) != null) {
      double _kelvin = double.parse(_kelvinController.text);
      double _celsius = _kelvin - 273;
      double _fahrenheit = (_kelvin - 273) * 1.8 + 32;

      _celsiusController.text = _celsius.toString();
      _fahrenheitController.text = _fahrenheit.toString();
    } else {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Atenção"),
        content: Text("Blob"),
        actions: [
          TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text(
                  "Ok",
                  style: TextStyle(
                      color: Colors.white
                  ),
              )
          )
        ],
      ));
    }
  }

  double? converteDouble(String texto){
    return double.tryParse(texto);
  }

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Celsius"),
          onTap: (){
            _fahrenheitController.text = "";
            _kelvinController.text = "";
          },
          controller: _celsiusController,
        ),
        SizedBox(height: _sizeBoxHeight),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Fahrenheit"),
          onTap: (){
            _celsiusController.text = "";
            _kelvinController.text = "";
          },
          controller: _fahrenheitController,
        ),
        SizedBox(height: _sizeBoxHeight),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Kelvin"),
          onTap: (){
            _fahrenheitController.text = "";
            _celsiusController.text = "";
          },
          controller: _kelvinController,
        ),
        SizedBox(height: _sizeBoxHeight),
        ElevatedButton(onPressed: _Calcular, child: const Text("Converter"))
      ]),
      ),
    );
  }
}
