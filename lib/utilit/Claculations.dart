import 'package:flutter/material.dart';

class Claculations {
  List<String> a = [];
  final RegExp reg = RegExp("[+\\-x÷%]");

  void add(String x) {
    // check if list is empty and string is not operator
    if (a.isEmpty) {
      if (!reg.hasMatch(x)) {
        a.add(x);
      }
    }
    // check if last element is a operator or digit
    else if (reg.hasMatch(a.last)) {
      if (!RegExp("[+\\-x÷.%]").hasMatch(x)) {
        a.add(x);
      }
    } else {
      if (reg.hasMatch(x)) {
        if (!RegExp('.').hasMatch(a.last)) {
          print('object');
          a.last += '.0';
        }
        a.add(x);
      } else {
        a.last += x;
      }
    }
  }

  double getResult() {
    // check if user ends calculations with a operator if true the remove last element in list
    if (reg.hasMatch(a.last) && !RegExp('%').hasMatch(a.last)) {
      a.removeLast();
    }
    // check if user ends calculations by a dot "." if true then remove dot
    while (a.last.lastIndexOf('.') == a.last.length - 1) {
      a.last = a.last.substring(0, a.last.length - 1);
      print(a.last);
    }
    // algorithm to make calculations
    for (int i = 0; i < a.length; i++) {
      // start from 0 and increment untill an operator is found
      if (a[i] == 'x') {
        // element at left of operator is assigned the value of calculations
        // element left of operator + right of operator = element left of operator
        a[i - 1] = "${double.parse(a[i - 1]) * double.parse(a[i + 1])}";
        // remove element at the index to have only 1 element left at a[0]
        a.removeAt(i);
        a.removeAt(i);
        // decrement the counter to 0 to start again
        i--;
      } else if (a[i] == '÷') {
        a[i - 1] = "${double.parse(a[i - 1]) / double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      }
    }
    for (int i = 0; i < a.length; i++) {
      if (a[i] == '+') {
        a[i - 1] = "${double.parse(a[i - 1]) + double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == '-') {
        a[i - 1] = "${double.parse(a[i - 1]) - double.parse(a[i + 1])}";
        a.removeAt(i);
        a.removeAt(i);
        i--;
      } else if (a[i] == "%") {
        a[i - 1] = (double.parse(a[i - 1]) / 100).toStringAsFixed(3);
        print([i - 1]);
        a.removeAt(i);
        i--;
      }
    }
    if (a.length != 1) throw Error();
    return double.parse(a[0]);
  }

  String getString() {
    String str = '';
    a.forEach((String element) {
      str += element;
    });
    return str;
  }

  void deletALl() {
    a = [];
  }

  void deleteOne() {
    if (a.length > 0) {
      if (a.last.length > 1) {
        a.last = a.last.substring(0, a.last.length - 1);
      } else
        a.removeLast();
    }
  }

  bool isOperator(String x) {
    if (x == "%" || x == "÷" || x == "x" || x == "-" || x == "+" || x == "=") {
      return true;
    } else
      return false;
  }
}
