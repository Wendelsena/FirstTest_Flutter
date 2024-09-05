import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  
  final int nota;

  Resultado(this.nota);

  String get fraseResultado {
    if (nota < 50) { 
      return '''Todo mundo passa por frustações às vezes. 
      Eu sei que você é incrível e capaz de tudo. Vai dar certo, 
      só continuar tentando e não desistir né. Tô aqui com você, sempre, meu xuxu!! 
      (Dica: Só errou uma)''';
    } else {
      return '''Parabéns, gatinho! Arrasou! Estou muito orgulhoso de você. 
      Continue assim, você é incrível e merece todo o sucesso do mundo!''';
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Parabéns!',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}