import 'package:flutter/material.dart';
import 'MyTimer.dart';

class InputAlertBox extends StatefulWidget {

  @override
  _InputAlertBoxState createState() => _InputAlertBoxState();
}

class _InputAlertBoxState extends State<InputAlertBox> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Container(
        width: MediaQuery.of(context).size.width * .9,
        padding: EdgeInsets.all(8),
        color: Colors.black,
        child: Center(
            child: Text(
          "Enter Timer",
          style: TextStyle(color: Colors.white),
        )),
      ),
      content: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .4,
            padding: EdgeInsets.all(5),
            color: Colors.black,
            child: Center(
              child: Text(
                "Hours",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Enter Hours",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),

            autofocus: true,
            onChanged: (value) {
              try {
                data["inpHours"] = int.parse(value);
              } catch (e) {
                data["inpHours"] = 404;
              }
            },
          ),
          SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width * .3,
            padding: EdgeInsets.all(5),
            color: Colors.black,
            child: Center(
              child: Text(
                "Minutes",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Enter Minutes",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),

            autofocus: true,
            onChanged: (value) {
              try {
                data["inpMins"] = int.parse(value);
              } catch (e) {
                data["inpMins"] = 404;
              }
            },
          ),
          SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width * .4,
            padding: EdgeInsets.all(5),
            color: Colors.black,
            child: Center(
              child: Text(
                "Seconds",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Enter Seconds",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),

            autofocus: true,
            onChanged: (value) {
              try {
                data["inpSecs"] = int.parse(value);
              } catch (e) {
                data["inpSecs"] = 404;
              } // data = value as int;
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {

            if(  data["inpMins"] == null ||
                data["inpSecs"] == null  ||
                data["inpHours"] == null ){

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      padding: EdgeInsets.all(8),
                      color: Colors.black,
                      child: Center(
                          child: Text(
                        "ERROR",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    content: Container(
                        child: Column(
                          mainAxisSize:MainAxisSize.min ,
                      children: [
                        Text("No Input Found"),
                        SizedBox(height:20),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: () {

                         Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        )
                      ],
                    )),
                  );
                },
              );



            }
            else if (data["inpHours"] == 404 ||
                data["inpMins"] == 404 ||
                data["inpSecs"] == 404  ||
                data["inpHours"] > 23 ||
                data["inpMins"] > 59  ||
                data["inpSecs"] > 59  
                ) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      padding: EdgeInsets.all(8),
                      color: Colors.black,
                      child: Center(
                          child: Text(
                        "ERROR",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    content: Container(
                        child: Column(
                          mainAxisSize:MainAxisSize.min ,
                      children: [
                        Text("Invalid Input"),
                        SizedBox(height:20),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => 
                                    MyTimer(data: data)));                           
                          },
                          child: Text("OK"),
                        )
                      ],
                    )),
                  );
                },
              );
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyTimer(data: data)));
            }
          },
          child: Text(
            "Done",
          ),
        )
      ],
    );
  }
}
