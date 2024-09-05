
import 'package:first_test_flutter/questionario.dart';
import 'package:first_test_flutter/resultado.dart';
import 'package:flutter/material.dart';

// Função principal que inicia a aplicação
main() {
  runApp(new PerguntaApp()); // Chama a função runApp e passa o widget 'PerguntaApp' como argumento
}

// Cria uma classe 'PerguntaAppState' que gerencia o estado do widget 'PerguntaApp'
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0; // Variável que armazena o índice da pergunta atual.
  var _notaTotal = 0;
  final _perguntas = const [  // Declara uma lista de strings chamada 'perguntas'
      {
        'texto' : 'Se eu, seu amor, fosse uma comida, qual eu seria?',
        'respostas' : [
          {'texto' : 'Pizza de calabresa, porque você é uma delícia', 'nota' : 10},
          {'texto' : 'Lasanha, bipolar de várias camadas.', 'nota' : 10},
          {'texto' : 'Chocolate branco, doce causador de diabetes (meu favorido).', 'nota' : 10},
          {'texto' : 'Brócolis... mas só pra você ser saudável (S2).', 'nota' : 10},
        ],
      },
      {
        'texto' : 'Se você pudesse escolher, qual seria seu superpoder?',
        'respostas' : [
          {'texto' : 'Invisibilidade, porque sou ciúmento, paranóico com dependência emocional.', 'nota' : 10},
          {'texto' : 'Voar, pra fugir de mim :(', 'nota' : 0},
          {'texto' : 'Teletransporte, pra estar sempre pertinho do seu amor (eu).', 'nota' : 10},
          {'texto' : 'Força sobre-humana, pra aguentar meu humor insuportával.', 'nota' : 10},
        ],
      },
      {
        'texto' : 'Se eu fosse um filme, qual seria o gênero?',
        'respostas' : [
          {'texto' : 'Comédia romântica, porque sou um charme (usando o app pra infliar meu ego).', 'nota' : 10},
          {'texto' : 'Ação (vir me ver na Cidade Nova não é facíl).', 'nota' : 10},
          {'texto' : 'Drama, porque às vezes eu sou dramático e insuportavél (desculpa).', 'nota' : 10},
          {'texto' : 'Ficção científica, nosso amor é de outro mundo gata!', 'nota' : 10},
        ],
      },
      {
        'texto' : 'O que você mais ama quando estamos juntos? (Quero sinceridade nessa)',
        'respostas' : [
          {'texto' : 'Quando pedimos temake pra comer.', 'nota' : 10},
          {'texto' : 'Quando a gente vai em japa encher o buxo.', 'nota' : 10},
          {'texto' : 'Quando a gente come sushi', 'nota' : 10},
          {'texto' : 'Tudo, não consigo escolher só uma coisa!', 'nota' : 10},
        ],
      },
          {
      'texto' : 'Se a gente fosse viajar agora, qual seria o destino perfeito?',
        'respostas' : [
          {'texto' : 'Paris, a cidade do amor, ulala', 'nota' : 10},
          {'texto' : 'Ilhas Maldivas, só nós dois e o mar eitaporra.', 'nota' : 10},
          {'texto' : 'co-com certeza Tóquio, we-wendelru-sama.', 'nota' : 10},
          {'texto' : 'Pintópolis - MG.', 'nota' : 10},
        ],
      },
    ];

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
      _perguntaSelecionada++; // Incrementa o valor da variável '_perguntaSelecionada' ao chamar 'responder'
      _notaTotal += nota;
      });
    }
  }

bool get temPerguntaSelecionada {
  return _perguntaSelecionada < _perguntas.length; // se pergunta for maior que tamanho da lista
}
  @override
  Widget build(BuildContext context) { // O método build é obrigatório em um StatelessWidget, e é onde a interface do widget é definida



    // Inicializa uma lista de Widgets chamada 'respostas' que irá armazenar os botões de resposta.
    // for (String textoRespo in perguntas[_perguntaSelecionada]['respostas'] as List<String>) { 
    /* O for itera sobre a lista 'respostas' do mapa 'perguntas'. 
    O 'as List<String>' garante que o Dart saiba que 'respostas' é uma lista de strings. 
    Para cada item na lista de respostas, será criada uma variável 'textoRespo', 
    que representa cada resposta individualmente (ex: "Azul", "Vermelho", etc.). */
    //widgets.add(Resposta(textoRespo, _responder)); 
    /* Adiciona um widget Resposta para cada resposta na lista, 
    passando o texto da resposta e a função '_responder' para tratar o clique. */ 
    // }



    return new MaterialApp(  // Retorna o widget MaterialApp, que é o widget raiz da sua aplicação
      home: Scaffold( // Scaffold fornece uma estrutura visual básica, como AppBar, Drawer, BottomNavigationBar, etc.
        appBar: AppBar( // AppBar é a barra de título no topo da tela
          title: Text('Perguntas'), 
        ),
        body: temPerguntaSelecionada 
        ? Questionario(perguntas: _perguntas, 
                       perguntaSelecionada: _perguntaSelecionada, 
                       quandoResponder: _responder)
         : Resultado(),
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

