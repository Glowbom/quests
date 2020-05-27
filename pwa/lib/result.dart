import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultText {
    return  'You got $resultScore correctly.';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultText,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}
