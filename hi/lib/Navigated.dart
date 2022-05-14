import 'package:flutter/material.dart';

class Navigated extends StatefulWidget {
  @override
  _NavigatedState createState() => _NavigatedState();
}

class _NavigatedState extends State<Navigated> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "My App Page",
        style: TextStyle(
            fontSize: 10,color: Colors.red),
      ),

SizedBox(height:20),

      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back")) //for back or to go one page behind in history
    ]);
  }
}
