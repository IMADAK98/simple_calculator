import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listview_builder/utilit/myContainer.dart';
import 'package:listview_builder/Pages/claculationScreen.dart';
import 'package:listview_builder/utilit/Claculations.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Claculations cal = Claculations();
  List myItems = [
    'C',
    'DEL',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];
  String question = '0';
  String answer = '';

  void onPress(int index) {
    setState(() {
      question += myItems[index];
      (cal.add(question));
      print(cal.a.last);
    });
  }

  void add(String a) {
    setState(() {
      cal.add(a);
      question = cal.getString();
    });
  }

  void onDeleteone() {
    setState(() {
      cal.deleteOne();
      question = cal.getString();
    });
  }

  void onDeleteAll() {
    setState(() {
      cal.deletALl();
      question = cal.getString();
      answer = cal.getString();
    });
  }

  void onGetResult() {
    setState(() {
      answer = cal.getResult().toString();
      question = cal.getString().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurple.shade100,
          body:
              // Main column where items will be shown in screen
              Column(
            children: [
              Expanded(
                  flex: 1,
                  child: claculationScreen(
                    question: question,
                    answer: answer,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: myItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          // clear button
                          if (index == 0) {
                            return myContainer(
                              buttonText: myItems[index],
                              mycolor: Colors.indigo[400],
                              onPress: () => onDeleteAll(),
                              onLongPress: () => onDeleteAll(),
                            );
                            // delete button
                          } else if (index == 1) {
                            return myContainer(
                              buttonText: myItems[index],
                              mycolor: Colors.red,
                              onPress: () => onDeleteone(),
                            );
                          } else {
                            return myContainer(
                              buttonText: myItems[index].toString(),
                              mycolor: cal.isOperator(myItems[index])
                                  ? Color.fromARGB(255, 119, 94, 167)
                                  : Colors.indigo[200],
                              onPress: () {
                                if (myItems[index] == '=' && cal.a.isNotEmpty) {
                                  onGetResult();
                                } else
                                  add(myItems[index]);
                              },
                            );
                          }
                        }),
                  ))
            ],
          )),
    );
  }
}
