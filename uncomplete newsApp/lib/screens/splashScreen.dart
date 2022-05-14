import 'package:flutter/material.dart';
import 'dart:async';

import '../all.dart';
import 'bottomNavBarState.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var splashScreenTimer;
  var myTimer = 0;

  timerPlay() {
    splashScreenTimer =
        new Timer.periodic(new Duration(milliseconds: 1000), (timer) {
      myTimer++;
      print("timer------->${myTimer}");
    if (myTimer == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomNavBarState(data:{},)));
      splashScreenTimer.cancel();
    }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    timerPlay();
    return Scaffold(
        body: 
      // child: Container(
      //       width: MediaQuery.of(context).size.width * 0.4,
      //       height: 40,
      //       child: ElevatedButton(
      //         onPressed:timerPlay,
      //         child: Text("Timer Start"),
      //       ),
      //     ),
      Container(
        width: MediaQuery.of(context).size.width*1,        
        height: MediaQuery.of(context).size.height*1,
        color: Theme.of(context).colorScheme.primary,
          child: Center(child: Text("MY NEWS APP",style: TextStyle(fontSize: 24,color:Theme.of(context).colorScheme.onPrimary,),))),
    );
  }
}
