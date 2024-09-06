import 'package:flutter/material.dart';
import 'questionario.dart'; // Importa o widget Questionario
import 'resultado.dart';   // Importa o widget Resultado

void main() {
  runApp(PerguntaApp()); // Inicializa o aplicativo com o widget PerguntaApp
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState(); // Cria o estado para PerguntaApp
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0; // Índice da pergunta atual
  var _notaTotal = 0; // Pontuação total do questionário
  bool _temaEscuro = false; // Estado do tema (claro ou escuro)
  bool _questionarioIniciado = false; // Se o questionário foi iniciado ou não

  final _perguntas = const [ // Lista de perguntas e respostas do questionário
    {
      'texto': 'Se eu, seu amor, fosse uma comida, qual eu seria? 1/5',
      'respostas': [
        {'texto': 'Brócolis... mas só pra você ser saudável (S2).', 'nota': 10},
        {'texto': 'Pizza de calabresa, porque eu sou uma delícia', 'nota': 10},
        {'texto': 'Lasanha, gostosa, mas de várias camadas. Bipolar. Tendências psicopaticas.', 'nota': 10},
        {'texto': 'Chocolate branco, doce, causador de diabetes e obesidade infantil.', 'nota': 10},
      ],
    },
    {
      'texto': 'Se você pudesse escolher, qual seria seu superpoder? 2/5',
      'respostas': [
        {'texto': 'Invisibilidade, porque sou ciúmento e estou ameaçando você e sua família (Clique aqui se estiver precisando de ajuda).', 'nota': 10},
        {'texto': 'Voar, só pra fugir de mim :(', 'nota': 0},
        {'texto': 'Teletransporte, pra estar sempre pertinho do seu amor (eu).', 'nota': 10},
        {'texto': 'Força sobre-humana, pra aguentar meu senso de humor insuportável.', 'nota': 10},
      ],
    },
    {
      'texto': 'Se eu fosse um filme, qual seria o gênero? 3/5',
      'respostas': [
        {'texto': 'Comédia romântica, porque sou um charme (usando o app pra inflar meu ego).', 'nota': 10},
        {'texto': 'Ação (vir me ver na Cidade Nova não é fácil).', 'nota': 10},
        {'texto': 'Drama, porque às vezes eu sou dramático e insuportável (desculpa).', 'nota': 10},
        {'texto': 'Ficção científica, nosso amor é de outro mundo gata!', 'nota': 10},
      ],
    },
    {
      'texto': 'O que você mais ama quando estamos juntos? (Quero sinceridade nessa) 4/5',
      'respostas': [
        {'texto': 'Quando pedimos temake pra comer.', 'nota': 10},
        {'texto': 'Quando a gente vai em restaurante japa encher o buxo.', 'nota': 10},
        {'texto': 'Quando a gente come sushi', 'nota': 10},
        {'texto': 'Tudo, não consigo escolher só uma coisa!', 'nota': 10},
      ],
    },
    {
      'texto': 'Se a gente fosse viajar agora, qual seria o destino perfeito? 5/5',
      'respostas': [
        {'texto': 'Paris, a cidade do amor, ulala', 'nota': 10},
        {'texto': 'Ilhas Maldivas, só nós dois e o mar eitaporra.', 'nota': 10},
        {'texto': 'Co-com certeza Tóquio, we-wendelru-sama >///<.', 'nota': 10},
        {'texto': 'Pintópolis - MG.', 'nota': 10},
      ],
    },
  ];

  // Método para responder a uma pergunta e avançar para a próxima
  void _responder(int nota) {
    setState(() {
      _notaTotal += nota; // Adiciona a nota da resposta à pontuação total
      _perguntaSelecionada++; // Avança para a próxima pergunta
    });
  }

  // Método para reiniciar o questionário
  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0; // Reseta o índice da pergunta
      _notaTotal = 0; // Reseta a pontuação total
      _questionarioIniciado = false; // Reseta o estado do questionário
    });
  }

  // Método para voltar para a pergunta anterior
  void _anteriorPergunta() {
    if (_perguntaSelecionada > 0) {
      setState(() {
        _perguntaSelecionada--; // Volta uma pergunta
      });
    }
  }

  // Método para alternar entre o tema claro e escuro
  void _alternarTema() {
    setState(() {
      _temaEscuro = !_temaEscuro; // Alterna o estado do tema
    });
  }

  // Método para iniciar o questionário
  void _iniciarQuestionario() {
    setState(() {
      _questionarioIniciado = true; // Define que o questionário foi iniciado
    });
  }

  // Getter para verificar se há perguntas restantes
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _temaEscuro ? ThemeData.dark() : ThemeData.light(), // Define o tema com base no estado
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Questionário do Fefe', // Título da AppBar
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(_temaEscuro ? Icons.light_mode : Icons.dark_mode), // Ícone para alternar tema
              onPressed: _alternarTema,
            ),
          ],
        ),
        body: _questionarioIniciado
            ? temPerguntaSelecionada
                ? Column(
                    children: [
                      Expanded(
                        child: Questionario(
                          perguntas: _perguntas, // Passa a lista de perguntas para o widget Questionario
                          perguntaSelecionada: _perguntaSelecionada, // Passa o índice da pergunta atual
                          quandoResponder: _responder, // Passa a função de resposta para o widget Questionario
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (_perguntaSelecionada > 0) // Verifica se há pergunta anterior
                            IconButton(
                              icon: const Icon(Icons.arrow_back), // Ícone para voltar
                              onPressed: _anteriorPergunta,
                            ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward), // Ícone para avançar
                            onPressed: temPerguntaSelecionada
                                ? () => _responder(0) // Avança para a próxima pergunta
                                : null,
                          ),
                        ],
                      ),
                    ],
                  )
                : Resultado(_notaTotal, _reiniciarQuestionario) // Mostra o resultado final
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bem-vindo!', // Texto de boas-vindas
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ao Quiz do Fefe', // Texto adicional
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 133, 196, 133), // Cor de fundo do botão
                        foregroundColor: Colors.black, // Cor do texto do botão
                        elevation: 5, // Sombra do botão
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0), // Espaçamento interno
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // Bordas arredondadas
                        ),
                      ),
                      onPressed: _iniciarQuestionario, // Inicia o questionário ao pressionar
                      child: const Text('Iniciar'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
