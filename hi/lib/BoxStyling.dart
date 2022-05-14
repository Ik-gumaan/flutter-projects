import 'package:flutter/material.dart';

class BoxStyling extends StatefulWidget {
  @override
  _BoxStylingState createState() => _BoxStylingState();
}

class _BoxStylingState extends State<BoxStyling> {
  @override
  Widget build(BuildContext context) {
    return Align( 
      alignment: Alignment.bottomRight, //Aligning container
          child: Container(
        padding: EdgeInsets.only(left:30),
        margin: EdgeInsets.only(top:10),
        width: 100,
        height: 100,
        child: Center(child: Text("Different File")),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.red,Colors.blue,Colors.yellow,
          ]),
            // color: Color(s.red),   //color: Color(HEXCODE), 
            borderRadius: BorderRadius.circular(30)),

      ),
    );
  }
}
