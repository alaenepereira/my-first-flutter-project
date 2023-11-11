import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() whenRestartQuiz;

  Result(this.score, this.whenRestartQuiz);

  String get phraseResult {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é muito bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível avançado!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Center(
          child: Text(phraseResult, style: TextStyle(fontSize: 28)),
        ),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Reiniciar?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
          onPressed: whenRestartQuiz 
        )
      ],
    );
  }
}
