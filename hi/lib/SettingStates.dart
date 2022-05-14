import 'package:flutter/material.dart';

class SettingStates extends StatefulWidget {
  @override
  _SettingStatesState createState() => _SettingStatesState();
}

class _SettingStatesState extends State<SettingStates> {
  
  var text=0;
  
one_inc(){
  setState((){
    text++;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
Text("Set State $text"),
SizedBox(height:20),
ElevatedButton(onPressed:one_inc,
child:Text("Make 1"),
),


          ],
        ),
      ),
    );
  }
}
