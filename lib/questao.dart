import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
final String texto;

Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text( // Exibe o primeiro item da lista 'perguntas'
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );  
  }
}