import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

final String texto;

Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Text(texto);  // Exibe o primeiro item da lista 'perguntas'
  }
}