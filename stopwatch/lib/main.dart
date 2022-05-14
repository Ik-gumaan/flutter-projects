
import 'package:flutter/material.dart';
import 'MyStopWatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // StopwatchPage(), 
      MyStopWatch(),
    );
  }
}

