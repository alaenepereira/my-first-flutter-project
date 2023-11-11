import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() => runApp(perguntaApp());

class _PerguntaAppState extends State<perguntaApp> {
  var _questionSelected = 0;
  var _scoreTotal = 0;

  final _questions = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'score': 10},
        {'texto': 'Azul', 'score': 8},
        {'texto': 'Verde', 'score': 3},
        {'texto': 'Laranja', 'score': 1},
      ],
    },
    {
      'texto': 'Qual a seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'score': 10},
        {'texto': 'Cachorro', 'score': 5},
        {'texto': 'Gato', 'score': 3},
        {'texto': 'Cavalo', 'score': 2},
      ],
    },
    {
      'texto': 'Qual a seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'score': 10},
        {'texto': 'Leo', 'score': 9},
        {'texto': 'Isa', 'score': 6},
        {'texto': 'Juliana', 'score': 1}
      ],
    }
  ];

  void _toRespond(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _questionSelected++;
        _scoreTotal += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _questionSelected = 0;
      _scoreTotal = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('perguntas'),
      ),
      body: hasSelectedQuestion
          ? Quiz(
              questions: _questions,
              questionSelected: _questionSelected,
              whenReply: _toRespond)
          : Result(_scoreTotal,  _restartQuiz),
    ));
  }
}

class perguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
