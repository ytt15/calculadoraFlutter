import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";
  String _lastOperation = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
      _lastOperation = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);
      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == "x") {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == "/") {
        if (_num2 != 0) {
          _output = (_num1 / _num2).toString();
        } else {
          _output = "Error";
        }
      }
      _lastOperation = _output;
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {
      _output = _output;
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilledButton(
          onPressed: () {
            _buttonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0),
          ),
        
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: const Divider(),
          ),
          Column(
            children: [
               Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
             
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("x"),
                ],
              ),
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: [
                  _buildButton("C"),
                  _buildButton("0"),
                  _buildButton("."),
                  _buildButton("+"),
                ],
              ),
              Row(
                children: [
                  _buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
