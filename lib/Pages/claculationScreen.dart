import 'package:flutter/material.dart';
import 'package:listview_builder/main.dart';

class claculationScreen extends StatelessWidget {
  final String question;
  final String answer;
  final String ANS;
  const claculationScreen(
      {super.key,
      required this.question,
      required this.answer,
      required this.ANS});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                ANS,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(203, 72, 69, 69)),
              ),
              Text(
                question,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ],
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
