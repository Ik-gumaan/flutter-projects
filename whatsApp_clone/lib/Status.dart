import 'package:flutter/material.dart';

import 'package:hi/Camera.dart';

import 'TxtStatus.dart';


class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
    var statusArr = [
  {
    "image":"assets/images/cr7.jpg",
    "name":"My status",
    "status":"",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"asim",
    "status":"i m here",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"sajjad",
    "status":"humanist",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"qadeer",
    "status":"i m superstar",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"farhan",
    "status":"Mr. Jhonny",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"Saeed",
    "status":"Chandio sahb",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"Touseer",
    "status":"Ertugal here...",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"Imran Brohi",
    "status":"sasta comedian",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"Shakir",
    "status":"k",
  },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundImage: AssetImage("assets/images/cr7.jpg"),
          //     radius: 35,
          //   ),
          //   title: Text(
          //     "My status",
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   subtitle: Text(
          //     "Yesterday, 12:01 p.m",
          //     style: TextStyle(
          //       fontSize: 12,
          //     ),
          //   ),
          //   trailing: Icon(Icons.more_horiz_sharp)
          // ),
          // SizedBox(height:5),

          // Text(
          //   "        Recent updates",
          //   style: TextStyle(
          //     fontSize: 14,
          //       fontWeight: FontWeight.w600,
          //   ),
          // ),
          // SizedBox(height:5),
          Expanded(
            child: ListView.builder(
                itemCount: statusArr.length,
                itemBuilder: (context, index) {
                  return statusArr[index]['name'] == "My status"
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              // tileColor: Colors.red,
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("${statusArr[index]['image']}"),
                                  radius: 35,
                                ),
                                title: Text(
                                  "${statusArr[index]['name']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  "Yesterday, 12:01 p.m",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: Icon(Icons.more_horiz_sharp)),
                            // SizedBox(height:5),

                            Container(
                              margin: EdgeInsets.only(left:30),
                              child: Text(
                                "Recent updates",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  backgroundColor: Colors.yellow,
                                ),
                              ),
                            ),
                          ],
                        )
                      : ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("${statusArr[index]['image']}"),
                            radius: 35,
                          ),
                          title: Text(
                            "${statusArr[index]['name']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            "1:51 p.m",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        );
                }),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.edit,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TxtStatus()));
            },
          ),
          // SizedBox(height: 15),
          // FloatingActionButton(
          //   backgroundColor: Colors.green,
          //   child: Icon(Icons.camera),
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Camera()));
          //   },
          // ),
        ],
      ),
    );
  }
}

class TextStatus {
}
