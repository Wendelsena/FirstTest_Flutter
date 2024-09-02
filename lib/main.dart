import 'package:flutter/material.dart';

// Função principal que inicia a aplicação
main() {
  runApp(new PerguntaApp()); // Chama a função runApp e passa o widget 'PerguntaApp' como argumento
}

// Cria uma classe 'PerguntaAppState' que gerencia o estado do widget 'PerguntaApp'
class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0; // Variável que armazena o índice da pergunta atual

  void responder() {
    setState(() {
      perguntaSelecionada++; // Incrementa o valor da variável 'perguntaSelecionada' ao chamar 'responder'
    });
    print(perguntaSelecionada); // Imprime o valor atualizado de 'perguntaSelecionada' no console
  }

  @override
  Widget build(BuildContext context) { // O método build é obrigatório em um StatelessWidget, e é onde a interface do widget é definida
    final List<String> perguntas = [  // Declara uma lista de strings chamada 'perguntas'
      'Qual sua cor favorita?',
      'Qual é o seu animal favorito'
    ];

    return new MaterialApp(  // Retorna o widget MaterialApp, que é o widget raiz da sua aplicação
      home: Scaffold( // Scaffold fornece uma estrutura visual básica, como AppBar, Drawer, BottomNavigationBar, etc.
        appBar: AppBar( // AppBar é a barra de título no topo da tela
          title: Text('Perguntas'), 
        ),
        body: Column( // Column é um widget que organiza seus filhos em uma coluna vertical
          children: <Widget>[
            Text(perguntas[perguntaSelecionada]),  // Exibe o primeiro item da lista 'perguntas'

            // Cria três botões elevados, cada um com um texto diferente
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder, // passa a função 'responder' como parâmetro
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: responder, 
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: responder, 
            ),
          ],
        ),
      ),
    );
  }
}

// Cria uma classe 'PerguntaApp' que é um StatefulWidget
class PerguntaApp extends StatefulWidget {

  @override
  PerguntaAppState createState() {
    return PerguntaAppState(); // Retorna uma nova instância da classe de estado associada a 'PerguntaApp'
  }
}

