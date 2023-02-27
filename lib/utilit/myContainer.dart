import 'package:flutter/material.dart';
import 'package:listview_builder/Pages/claculationScreen.dart';
import 'package:listview_builder/main.dart';
import 'package:listview_builder/Pages/claculationScreen.dart';

class myContainer extends StatelessWidget {
  final String buttonText;
  final void Function()? onPress;
  final Color? mycolor;
  final void Function()? onLongPress;

  myContainer({
    super.key,
    required this.buttonText,
    required this.mycolor,
    this.onPress,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: mycolor,
        ),
        child: MaterialButton(
          onPressed: onPress,
          onLongPress: onLongPress,
          elevation: 0,
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
