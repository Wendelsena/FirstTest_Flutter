import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Largura fixa do Container
      padding: EdgeInsets.symmetric(vertical: 8.0), // Padding vertical para espaçar os botões
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 223, 183, 123), // Cor de fundo
          foregroundColor: Colors.black, // Cor do texto
          elevation: 5, // Sombra do botão
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0), // Padding interno do botão
        ),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 18, // Tamanho da fonte
            fontWeight: FontWeight.bold, // Negrito para destacar o texto
          ),
          textAlign: TextAlign.center, // Alinha o texto ao centro
        ),
        onPressed: quandoSelecionado, 
      ),
    );
  }
}
