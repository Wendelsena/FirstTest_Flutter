import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota; // Nota total obtida no questionário
  final void Function() quandoReiniciarQuestionario; // Função para reiniciar o questionário

  Resultado(this.nota, this.quandoReiniciarQuestionario);

  // Método que retorna uma frase com base na nota
  String get fraseResultado {
    if (nota == 40) { 
      return '''Todo mundo passa por frustrações às vezes. 
Eu sei que você é incrível e capaz de tudo. Vai dar certo, 
só continuar tentando e não desistir né. Tô aqui com você, sempre, meu xuxu!! 
(Dica: Só errou uma)''';
    } else if (nota == 50) {
      return '''Parabéns, gatinho! Arrasou! Estou muito orgulhoso de você. 
Continue assim, você é incrível e merece todo o sucesso do mundo! Te amo.''';
    } else {
      return 'Não vale pular questão, viado!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Espaçamento externo
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
        children: [
          Container(
            padding: const EdgeInsets.all(16), // Espaçamento interno
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 255, 221), // Cor de fundo do container
              borderRadius: BorderRadius.circular(12), // Bordas arredondadas
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12, // Cor da sombra
                  blurRadius: 10, // Difusão da sombra
                  offset: Offset(0, 5), // Deslocamento da sombra
                ),
              ],
            ),
            child: Text(
              fraseResultado, // Texto com a frase de resultado
              style: const TextStyle(
                fontSize: 24, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Negrito para destaque
                color: Colors.black87, // Cor do texto
                height: 1.5, // Espaçamento entre linhas
              ),
              textAlign: TextAlign.center, // Alinhamento central do texto
            ),
          ),
          const SizedBox(height: 30), // Espaçamento entre o texto e o botão
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Cor do texto do botão
              backgroundColor: const Color.fromARGB(255, 0, 158, 40), // Cor de fundo do botão
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 36), // Padding interno
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              ),
              elevation: 5, // Sombra no botão
            ),
            onPressed: quandoReiniciarQuestionario, // Função chamada ao pressionar o botão
            child: const Text(
              'Continuar Tentando?', // Texto do botão
              style: TextStyle(
                fontSize: 18, // Tamanho da fonte do botão
                fontWeight: FontWeight.w600, // Seminegrito
              ),
            ),
          ),
        ],
      ),
    );
  }
}
