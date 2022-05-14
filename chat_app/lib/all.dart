import 'package:chat_app/components/myTheme.dart';
import 'package:chat_app/screens/homeScreen.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:flutter/material.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Main"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap:(){
              currentTheme.toggleTheme();
            },
            child:Icon(Icons.brightness_3),
          ),
        ],
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text("LOGIN"),
            ),
          ),
          SizedBox(height:20),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signup()));
              },
              child: Text("SIGNUP"),
            ),
          ),
          SizedBox(height:20),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text("HOME"),
            ),
          )
        ],
    ),
      )
    );
  }
}
