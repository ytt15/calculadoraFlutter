import 'package:calculando/operaciones.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
    const CalculatorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}
