import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectFunction;

  Answer(this.selectFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text('a1'),
        onPressed: selectFunction,
      ),
    );
  }
}
