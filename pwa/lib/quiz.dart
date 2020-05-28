import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['description'],
        ),
        ...(questions[questionIndex]['buttonsTexts'] as List<String>).map((buttonText) {
          int index = (questions[questionIndex]['buttonsTexts'] as List<String>).indexOf(buttonText);
          return Answer(() => answerQuestion((questions[questionIndex]['buttonAnswers'] as List<Object>)[index]), buttonText);
        }).toList()
      ],
    );
  }
}
