import 'package:flutter/material.dart';
import 'data_local.dart';
// import 'ToDoApp.dart';

void main() {
  runApp(MyApp()); //runApp(widget/className)
}

class MyApp extends StatelessWidget {
  //default flutter class name: MyApp otherwise error due to test/widget_test.dart
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // to remove banner on top-right
      //change Container to MaterialApp coz MaterialApp is a class which supports more widgets than container
      home: MyHomePage(title: 'Shared preferences demo'),
      // ToDoApp(),
    );
  }
}
