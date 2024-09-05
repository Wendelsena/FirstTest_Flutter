import 'package:first_test_flutter/questao.dart';
import 'package:first_test_flutter/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder
  });

  bool get temPerguntaSelecionada {
  return perguntaSelecionada < perguntas.length; // se pergunta for maior que tamanho da lista
  }

  @override
  Widget build(BuildContext context) {


    List<Map<String, Object>> respostas = temPerguntaSelecionada 
    ? perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>> : [];
    // Declara uma lista de strings 'respostas', pegando o valor da chave 'respostas' do mapa 'perguntas'.
    // O 'as List<String>' garante que o Dart saiba que esse valor é uma lista de strings.
     List<Widget> widgets = respostas.map((resp) => Resposta(resp['texto'] as String, responder)).toList();
    // O método 'map' itera sobre a lista de respostas e cria um widget 'Resposta' para cada item (t).
    // A função 'map' retorna um Iterable, então usamos '.toList()' para convertê-lo em uma lista de widgets.


    return Column( // Column é um widget que organiza seus filhos em uma coluna vertical
      children: <Widget> [  // Adiciona a pergunta como um widget no layout.
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...widgets,
          /* O '...respostas' é o operador spread, que pega cada item da lista 'respostas' 
            e os insere individualmente na lista de widgets da Column.
            Assim, cada botão de resposta será adicionado dinamicamente de acordo com a pergunta selecionada. */
      ],
    );
  }
}