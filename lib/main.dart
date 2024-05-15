// Calcular IMC
import 'package:flutter/material.dart';


void main()=> runApp(MyApp());


class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora IMC",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraIMCPage(),
    );
  }
}


class CalculadoraIMC{
  double calcularIMC(double peso, double altura){
    return peso/(altura*altura);
  }
}


class CalculadoraIMCPage extends StatefulWidget{
  _CalculadoraIMCPageState createState() => _CalculadoraIMCPageState();
}


class _CalculadoraIMCPageState extends State<CalculadoraIMCPage>{
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double resultadoIMC = 0.0;


  void calcularIMC(){
    double peso = double.tryParse(pesoController.text)?? 0.0;
    double altura = double.tryParse(alturaController.text)?? 0.0;


    setState((){
      resultadoIMC = CalculadoraIMC().calcularIMC(peso, altura);
    });
  }
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Calculadora IMC", style: TextStyle(fontSize: 30),),
      backgroundColor: Colors.white,
      foregroundColor: Color.fromARGB(255, 1, 97, 6),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: alturaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Altura(m)"),
          ),
          TextField(
            controller: pesoController,
            decoration: InputDecoration(labelText: "Peso(kg)"),
          ),
          ElevatedButton(
            onPressed: calcularIMC,
            child: Text("Calcular IMC"),
          ),
          Text("Seu IMC é: ${resultadoIMC.toStringAsFixed(2)}"),
        ],
      ),
    ),
  );
}    
}
