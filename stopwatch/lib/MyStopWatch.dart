import 'package:flutter/material.dart';
import 'dart:async';
import 'MyTimer.dart';

class MyStopWatch extends StatefulWidget {
  @override
  _MyStopWatchState createState() => _MyStopWatchState();
}

class _MyStopWatchState extends State<MyStopWatch> {
  late Timer timer;

  var stop = true;

  var inpMins = 0;

  var millisecs = 0;
  var hours = 0;
  var mins = 0;
  var secs = 0;

  void initState() {}

  handlePlayPause() {
    stop = !stop;
    if (stop) {
      timerPause();
    } else {
      timerPlay();
    }
  }

  timerPlay() {
    timer = new Timer.periodic(new Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (secs < 60) {
          secs++;
        }
        if (secs == 60) {
          mins++;
          secs = 0;
        }

        if (mins == 60) {
          hours++;
          mins = 0;
        }
      });
    });
  }

  timerPause() {
    timer.cancel();
    setState(() {});
  }

  reset() {
    if(stop==false){
    timer.cancel();
    stop = true;
    }
    setState(() {
      hours = 0;
      mins = 0;
      secs = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        mini: false,
        onPressed: () {
          // reset();
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyTimer(data: {},)));
        },
        child: Icon(
          Icons.timer,
          size: 30,
        ),
      ),
      appBar: AppBar(
        leading: Icon(Icons.lock_clock_rounded,color: Colors.white,size: 24,),
        automaticallyImplyLeading:false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title:Text("StopWatch"),
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * .9,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hours < 10 ? "0$hours" : "$hours",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                        ),
                  ),
                  Text(
                    mins < 10 ? " : 0$mins" : " : $mins",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                        ),
                  ),
                  Text(
                    secs < 10 ? " : 0$secs" : " : $secs",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: 80,
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: reset,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue)),
                      child: Icon(
                        Icons.restart_alt_rounded,
                        size: 40,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: 80,
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: handlePlayPause,
                      style: ButtonStyle(
                          backgroundColor: !stop
                              ? MaterialStateProperty.all(Colors.red)
                              : MaterialStateProperty.all(Colors.green)),
                      child: !stop
                          ? Icon(
                              Icons.pause_circle,
                              size: 40,
                            )
                          : Icon(
                              Icons.play_circle,
                              size: 40,
                            )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
