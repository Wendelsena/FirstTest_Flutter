import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto; // Texto da pergunta

  Questao(this.texto, {Key? key}) : super(key: key); // Adiciona o parâmetro key ao construtor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Largura total disponível
      margin: const EdgeInsets.all(30), // Margem ao redor do Container
      child: Text(
        texto, // Texto da pergunta
        style: const TextStyle(
          fontSize: 28, // Tamanho da fonte
        ),
        textAlign: TextAlign.center, // Alinhamento central do texto
      ),
    );
  }
}
