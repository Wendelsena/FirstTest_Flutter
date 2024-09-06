import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado, {Key? key}) : super(key: key); // Adiciona o parâmetro key

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Largura fixa do Container
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding vertical para espaçar os botões
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
         backgroundColor: const Color.fromARGB(255, 133, 196, 133),
          foregroundColor: Colors.black, // Cor do texto
          elevation: 5, // Sombra do botão
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0), // Padding interno do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // Ajuste do raio da borda
          ),
        ),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 18, // Tamanho da fonte
            fontWeight: FontWeight.bold, // Negrito para destacar o texto
          ),
          textAlign: TextAlign.center, // Alinha o texto ao centro
        ), 
      ),
    );
  }
}
