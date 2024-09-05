import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.nota, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (nota < 50) { 
      return '''Todo mundo passa por frustrações às vezes. 
Eu sei que você é incrível e capaz de tudo. Vai dar certo, 
só continuar tentando e não desistir né. Tô aqui com você, sempre, meu xuxu!! 
(Dica: Só errou uma)''';
    } else {
      return '''Parabéns, gatinho! Arrasou! Estou muito orgulhoso de você. 
Continue assim, você é incrível e merece todo o sucesso do mundo! Te amo.''';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, // Negrito para destacar o texto
                color: Colors.black87, // Cor do texto para melhor contraste
                height: 1.5, // Espaçamento entre linhas
              ),
              textAlign: TextAlign.center, // Alinha o texto ao centro
            ),
          ),
          SizedBox(height: 20), // Espaçamento entre o texto e o botão
          TextButton(
            child: Text('Continuar Tentando?'),
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 0, 158, 40), // Cor do texto
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Padding interno
            ),
            onPressed: quandoReiniciarQuestionario,
          ),
        ],
      ),
    );
  }
}
