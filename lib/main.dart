import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listview_builder/Pages/homePage.dart';
import 'package:listview_builder/utilit/myContainer.dart';
import 'package:listview_builder/Pages/claculationScreen.dart';
import 'utilit/Claculations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        title: "CALCULATOR",
        home: homePage());
  }
}
