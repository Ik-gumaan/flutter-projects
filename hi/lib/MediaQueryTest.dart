import 'package:flutter/material.dart';

class MediaQueryTest extends StatefulWidget {
  @override
  _MediaQueryTestState createState() => _MediaQueryTestState();
}

class _MediaQueryTestState extends State<MediaQueryTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
   
        color: Colors.blue,
        width: MediaQuery.of(context).size.width*0.5, //for responsive width   //size=> 50% = *0.5
        height: MediaQuery.of(context).size.height*0.5, //for responsive height //size=> 80% = *0.8
   
    );
  }
}
