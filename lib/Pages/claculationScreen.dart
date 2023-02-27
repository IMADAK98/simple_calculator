import 'package:flutter/material.dart';
import 'package:listview_builder/main.dart';

class claculationScreen extends StatelessWidget {
  final String question;
  final String answer;
  const claculationScreen(
      {super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            question,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: Text(
            answer,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }
}
