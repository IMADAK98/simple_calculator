import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listview_builder/utilit/DivideByZero_erorr.dart';
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
    'ANS',
    '=',
  ];
  String question = '0';
  String answer = '0';
  String Ans = '  ';

  void add(String a) {
    setState(() {
      cal.add(a);
      question = cal.getString();
      answer = cal.getString();
    });
  }

  void onDeleteone() {
    setState(() {
      cal.deleteOne();
      question = cal.getString();
      answer = cal.getString();
    });
  }

  void onDeleteAll() {
    setState(() {
      cal.deleteALl();
      question = cal.getString();
      answer = cal.getString();
    });
  }

  void onClearScreen() {
    setState(() {
      cal.deleteALl();
      question = cal.getString();
      answer = cal.getString();
      Ans = cal.getString();
    });
  }

// get result from CLaculations class
  void onGetResult() {
    setState(() {
      try {
        answer = cal.getResult().toString();
        question = cal.getResult().toString();
      } on DivideByZeroException {
        answer = "You can not divide by zero";
      } finally {
        // reset the instance
        cal = new Claculations();
      }
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
                    ANS: Ans,
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
                              onLongPress: () => onClearScreen(),
                            );
                            // delete button
                          } else if (index == 1) {
                            return myContainer(
                              buttonText: myItems[index],
                              mycolor: Colors.red,
                              onPress: () => onDeleteone(),
                            );
                          } else {
                            // the rest of the buttons
                            return myContainer(
                              buttonText: myItems[index].toString(),
                              // color the buttons ,, if its an operator give it a different color
                              mycolor: cal.isOperator(myItems[index])
                                  ? Color.fromARGB(255, 119, 94, 167)
                                  : Colors.indigo[200],
                              onPress: () {
                                if (myItems[index] == '=' && cal.a.isNotEmpty) {
                                  onGetResult();
                                  Ans = answer;
                                } else if (myItems[index] == "ANS") {
                                  setState(() {
                                    question = Ans;
                                    cal.a.add(Ans);
                                  });
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
