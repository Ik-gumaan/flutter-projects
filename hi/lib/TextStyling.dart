import 'package:flutter/material.dart';

class TextStyling extends StatefulWidget {
  @override
  _TextStylingState createState() => _TextStylingState();
}

class _TextStylingState extends State<TextStyling> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Text Styling",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30,
        fontWeight: FontWeight.bold,

      ),
      ),
    );
  }
}