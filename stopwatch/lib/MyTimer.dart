import 'package:flutter/material.dart';
import 'dart:async';
import 'package:stopwatch/MyStopWatch.dart';
import 'InputAlertBox.dart';

class MyTimer extends StatefulWidget {
  Map data;
  MyTimer({required this.data});

  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  var stop = true;
  var disabled = false;

  // var millisecs = 0;

  var inpHours = 0;
  var inpMins = 0;
  var inpSecs = 0;

  var hours = 0;
  var mins = 0;
  var secs = 0;

  late Timer timer;

  void initState() {
    if (widget.data["inpHours"] == null ||
        widget.data["inpMins"] == null ||
        widget.data["inpSecs"] == null) {
      hours = 0;
      mins = 0;
      secs = 0;
    } else if (widget.data["inpHours"] == 404 ||
        widget.data["inpMins"] == 404 ||
        widget.data["inpSecs"] == 404) {
      hours = 0;
      mins = 0;
      secs = 0;
    } else if (widget.data["inpHours"] < 24 &&
        widget.data["inpMins"] < 60 &&
        widget.data["inpSecs"] < 60) {
      hours = widget.data["inpHours"];
      mins = widget.data["inpMins"];
      secs = widget.data["inpSecs"];
    }
  }

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
        if (secs == 0 && mins == 0 && hours > 0) {
          hours--;
          mins = 60;
        }

        if (secs == 0 && mins > 0) {
          mins--;
          secs = 60;
        }

        if (secs > 0) {
          secs--;
        }

        if (secs == 0 && hours == 0 && mins == 0) {
          myTimerDone();
        }
      });
    });
  }

  timerPause() {
    // print("Play=========> $stop");
    timer.cancel();
    setState(() {});
  }

  myTimerDone() {
    timer.cancel();
    stop = true;
    disabled = true;
    // return "Timer Done!!";
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
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return InputAlertBox();
              },
            );
          },
          child: Text(
            "Add Timer",
            style: TextStyle(color: Colors.white),
          )),
      appBar: AppBar(
        title: Text("Timer"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyStopWatch()));
            },
            child: Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            )),
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
                  )
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
