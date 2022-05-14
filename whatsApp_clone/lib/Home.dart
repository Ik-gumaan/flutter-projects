import 'package:flutter/material.dart';

import 'Calls.dart';
import 'Camera.dart';
import 'Status.dart';
import 'Chat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var searchVar = false;

  searchFunc() {
    setState(() {
      searchVar = !searchVar;
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: searchVar
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: searchFunc,
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // focusedBorder: UnderlineInputBorder(

                          //   borderSide: BorderSide(color: Colors.white),
                          // ),
                        ),
                        autofocus: true,
                        onChanged: (value) {
                          // item = value;
                        },
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("WhatsApp"),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: searchFunc, child: Icon(Icons.search)),
                          SizedBox(width: 10),
                          Icon(Icons.more_vert_sharp),
                        ],
                      ),
                    )
                  ],
                ),
          backgroundColor: Colors.green[500],
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              tabs: [
                Container(
                  // width: 30,
                  width:MediaQuery.of(context).size.width * .1,
                  alignment: Alignment.center,
                  child: Tab(child: Icon(Icons.camera)),
                ),

                Container(
                  // width: 100,
                  width:MediaQuery.of(context).size.width * .3,
                  alignment: Alignment.center,

                  child: Tab(child: Text("CHAT")),
                ),

                Container(
                  // width: 100,
                  width:MediaQuery.of(context).size.width * .3,
                  alignment: Alignment.center,
                  child: Tab(child: Text("STATUS")),
                ),

                Container(
                  // width: 100,
                  width:MediaQuery.of(context).size.width * .3,
                  alignment: Alignment.center,
                  child: Tab(child: Text("CALLS")),
                ),

                //   Container(
                // width:MediaQuery.of(context).size.width * .3,
                //     child: Tab(child: Center(child: Text("CALLS"))),
                //   ),
              ]),
        ),
        body: TabBarView(children: [
          Camera(),
          Chat(),
          Status(),
          Calls(),
        ]),
      ),
    );
  }
}
