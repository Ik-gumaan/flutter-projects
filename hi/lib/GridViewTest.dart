import 'package:flutter/material.dart';

class GridViewTest extends StatefulWidget {
  @override
  _GridViewTestState createState() => _GridViewTestState();
}

class _GridViewTestState extends State<GridViewTest> {

  var lst = ["hi", "hello", "bye"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
crossAxisCount:2 ,//crossAxisCount means how many widgets can we take in one line/row
crossAxisSpacing: 50,//left to right spacing
mainAxisSpacing: 50,//top to bottom spacing
      children: 
        List.generate(lst.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 150,
              width:150,
              color: Colors.lightGreenAccent,
              child: Center(child: Text(lst[index])),
            ),
          );
        })
,
      ),      
    );
  }
}
