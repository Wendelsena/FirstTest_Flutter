import 'package:first_test_flutter/questao.dart';
import 'package:first_test_flutter/resposta.dart';
import 'package:flutter/material.dart';

// Função principal que inicia a aplicação
main() {
  runApp(new PerguntaApp()); // Chama a função runApp e passa o widget 'PerguntaApp' como argumento
}

// Cria uma classe 'PerguntaAppState' que gerencia o estado do widget 'PerguntaApp'
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0; // Variável que armazena o índice da pergunta atual

  void _responder() {
    setState(() {
      _perguntaSelecionada++; // Incrementa o valor da variável '_perguntaSelecionada' ao chamar 'responder'
    });
    print(_perguntaSelecionada); // Imprime o valor atualizado de '_perguntaSelecionada' no console
  }

  @override
  Widget build(BuildContext context) { // O método build é obrigatório em um StatelessWidget, e é onde a interface do widget é definida
    final perguntas = [  // Declara uma lista de strings chamada 'perguntas'
      {
        'texto' : 'Qual é sua cor favorita?', 
        'respostas' : ['Azul', 'Vermelho', 'Preto', 'Branco',],
      },
      {
        'texto' : 'Qual é seu jogo favorita?', 
        'respostas' : ['Red Dead 2', 'GTA 5', 'The Witcher 3', 'Dark Souls'],
      },
      {
        'texto' : 'Qual é seu anime favorito?', 
        'respostas' : ['One Piece', 'Naruto Shippuden', 'Cowboy Bebop', 'Jujutsu Kaisen',]
      },
    
    ];


    List<Widget> widgets= []; 
    // Inicializa uma lista de Widgets chamada 'respostas' que irá armazenar os botões de resposta.
    for (String textoRespo in perguntas[_perguntaSelecionada]['respostas'] as List<String>) { 
    /* O for itera sobre a lista 'respostas' do mapa 'perguntas'. 
    O 'as List<String>' garante que o Dart saiba que 'respostas' é uma lista de strings. 
    Para cada item na lista de respostas, será criada uma variável 'textoRespo', 
    que representa cada resposta individualmente (ex: "Azul", "Vermelho", etc.). */
    widgets.add(Resposta(textoRespo, _responder)); 
    /* Adiciona um widget Resposta para cada resposta na lista, 
    passando o texto da resposta e a função '_responder' para tratar o clique. */
}


    return new MaterialApp(  // Retorna o widget MaterialApp, que é o widget raiz da sua aplicação
      home: Scaffold( // Scaffold fornece uma estrutura visual básica, como AppBar, Drawer, BottomNavigationBar, etc.
        appBar: AppBar( // AppBar é a barra de título no topo da tela
          title: Text('Perguntas'), 
        ),
        body: Column( // Column é um widget que organiza seus filhos em uma coluna vertical
          children: <Widget>[  // Adiciona a pergunta como um widget no layout.
            Questao(perguntas[_perguntaSelecionada]['texto'] as String),
            ...widgets,
             /* O '...respostas' é o operador spread, que pega cada item da lista 'respostas' 
                e os insere individualmente na lista de widgets da Column.
                Assim, cada botão de resposta será adicionado dinamicamente de acordo com a pergunta selecionada. */
          ],
        ),
      ),
    );
  }
}

// Cria uma classe 'PerguntaApp' que é um StatefulWidget
class PerguntaApp extends StatefulWidget {

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState(); // Retorna uma nova instância da classe de estado associada a 'PerguntaApp'
  }
}

