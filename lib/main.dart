import 'package:flutter/material.dart';
//Cambio para segundo commits
void main(){
  runApp(const CalculadoraApp());
  }

  class CalculadoraApp extends StatelessWidget{
    const CalculadoraApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const CalculadoraScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
      );
    }
  }

  class CalculadoraScreen extends StatefulWidget{
    const CalculadoraScreen({super.key});

    @override
    State<CalculadoraScreen> createState() => _CalculadoraScreenState();
  }

  class _CalculadoraScreenState extends State<CalculadoraScreen> {
    String _output = "0";
    String _input = "";
    double _num1 = 0;
    double _num2 = 0;
    String _operator = "";

    void _buttonPressed(String value) {
      setState(() {
        if (value == "C") {
          _output = "0";
          _input = "";
          _num1 = 0;
          _num2 = 0;
          _operator = "";
        } else if (value == "+" || value == "-" || value == "x" || value == "/") {
          _num1 = double.tryParse(_input) ?? 0; // Intenta convertir _input a double; si falla (null), asigna 0
          _operator = value;
          _input = "";
        } else if (value == "=") {
          _num2 = double.tryParse(_input) ?? 0; 
          switch (_operator) {
            case "+":
              _output = (_num1 + _num2).toString();
              break;
            case "-":
              _output = (_num1 - _num2).toString();
              break;
            case "x":
              _output = (_num1 * _num2).toString();
              break;
            case "/":
              _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
              break;
          }
          _input = _output;
        } else {
          _input += value;
          _output = _input;
        }
      });
    }

  Widget _buildButton(String value, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: color,
          ),
          onPressed: () => _buttonPressed(value),
          child: Text(
            value,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                _buildButton("C", color: Colors.red),
                ],
              ),
              Row(
                children: [
                  _buildButton("7", color: Colors.black),
                  _buildButton("8", color: Colors.black),
                  _buildButton("9", color: Colors.black),
                  _buildButton("/", color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("4", color: Colors.black),
                  _buildButton("5", color: Colors.black),
                  _buildButton("6", color: Colors.black),
                  _buildButton("x", color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("1", color: Colors.black),
                  _buildButton("2", color: Colors.black),
                  _buildButton("3", color: Colors.black),
                  _buildButton("-", color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton(".", color: Colors.black),
                  _buildButton("0", color: Colors.black),
                  _buildButton("=", color: Colors.blue),
                  _buildButton("+", color: Colors.orange),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
 }