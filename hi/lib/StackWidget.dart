import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  @override
  _StackWidgetState createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [ //object will come on top of each other....

      Align(
        alignment: Alignment.topLeft,
        child: Container(
          color: Colors.blue,
          width: 100,
          height: 100,
        ),
      ),
      
        Positioned(
          top: 40,left:40, //use to unhide the bottom object...
                  child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
          ),
        ),
    ]);
  }
}
