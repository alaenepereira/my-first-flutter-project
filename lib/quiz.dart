import 'package:flutter/material.dart';
import './question.dart';
import './response.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function(int) whenReply;

  Quiz({
    required this.questions,
    required this.questionSelected,
    required this.whenReply,
  });

  bool get hasSelectedQuestion {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> widget = hasSelectedQuestion
        ? questions[questionSelected].cast()['respostas']
        : [];
    return Column(children: <Widget>[
      Question(questions[questionSelected]['texto'].toString()),
      ...widget.map((resp) {
        return Response(
          resp['texto'].toString(),
          () => whenReply(int.parse(resp['score'].toString())),
        );
      }).toList(),
    ]);
  }
}
