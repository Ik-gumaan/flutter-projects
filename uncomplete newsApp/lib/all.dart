import 'package:flutter/material.dart';
import 'package:news_app_mini_hackathon_flutter/screens/bottomNavBarState.dart';

import 'components/myTheme.dart';
import 'screens/homeScreen.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/splashScreen.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("MAIN"),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              child: Text("SPLASH"),
            ),
          ),
          SizedBox(height:20),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyBottomNavBarState(data:{})));
              },
              child: Text("HOME"),
            ),
          ),
        ],
    ),
      )
    );
  }
}
