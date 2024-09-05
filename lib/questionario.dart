import 'package:first_test_flutter/questao.dart';
import 'package:first_test_flutter/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
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



     List<Widget> widgets = respostas.map((resp) { 
        // 'respostas' é uma lista de mapas, onde cada mapa contém uma resposta e uma pontuação.
        // O 'map' itera sobre a lista de respostas, aplicando a função a seguir a cada item da lista (resp).
        return Resposta(
          resp['texto'].toString(), 
          // Para cada item 'resp', pega o valor da chave 'texto' e o converte para uma string.
          // Esse valor será exibido no botão da resposta.

          () => quandoResponder(int.parse(resp['pontuacao'].toString())), 
          // Define uma função anônima para ser chamada ao clicar no botão de resposta.
          // A função chama 'quandoResponder' passando a pontuação associada à resposta.
          // A pontuação é convertida de String para int usando 'int.parse()'.
        );
      }).toList();  // 'toList()' converte o resultado do map, que é um Iterable, para uma lista de widgets.



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