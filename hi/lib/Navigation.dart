import 'package:flutter/material.dart';
import 'Navigated.dart';


class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Navigated()));
          },
          child: Text("click to navigate"),
    );
  }
}
