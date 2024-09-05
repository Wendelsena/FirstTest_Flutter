import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  
  final int nota;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.nota, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (nota < 50) { 
      return '''Todo mundo passa por frustações às vezes. 
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: Text('Continuar Tentando?'),
          style: TextButton.styleFrom(
          foregroundColor: Colors.blue, // cor de fundo
          ),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}