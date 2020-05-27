import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartFunction;

  Result(this.resultScore, this.restartFunction);

  String get resultText {
    return 'You got $resultScore correctly.';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Start Over'),
            textColor: Colors.blue,
            onPressed: restartFunction,
          ),
        ],
      ),
    );
  }
}
