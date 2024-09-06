import 'package:flutter/material.dart';
import 'resposta.dart'; // Importa o widget Resposta
import 'questao.dart';  // Importa o widget Questao

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas; // Lista de perguntas
  final int perguntaSelecionada; // Índice da pergunta atual
  final void Function(int) quandoResponder; // Função chamada ao selecionar uma resposta

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  @override
  Widget build(BuildContext context) {
    final perguntaAtual = perguntas[perguntaSelecionada]; // Obtém a pergunta atual com base no índice

    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500), // Duração da animação de transição
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation, // Animação de fade na transição entre perguntas
              child: child,
            );
          },
          child: Questao(
            perguntaAtual['texto'].toString(), // Texto da pergunta atual
            key: ValueKey<int>(perguntaSelecionada), // Chave única baseada no índice da pergunta
          ),
        ),
        ...(perguntaAtual['respostas'] as List<Map<String, Object>>).map((resposta) {
          return Resposta(
            resposta['texto'].toString(), // Texto da resposta
            () => quandoResponder(resposta['nota'] as int), // Callback para a resposta
            key: ValueKey<String>(resposta['texto'].toString()), // Chave única baseada no texto da resposta
          );
        }).toList(),
      ],
    );
  }
}
