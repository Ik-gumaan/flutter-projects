import 'package:flutter/material.dart';

import 'AddCall.dart';
import 'Contacts.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {


  var callsArr=[
    {
    "image":"assets/images/cr7.jpg",
    "name":"asim",
    "status":"i m here",
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
    "name":"Sharjeel",
    "status":"I m an idiot",
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
      body: ListView.builder(
          itemCount: callsArr.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("${callsArr[index]['image']}"),
                radius: 35,
              ),
              title: Text(
                "${callsArr[index]['name']}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Row(children:[
                Icon(Icons.call_missed,size: 12,color: Colors.green,),
                Text(
                "(16) 1:51 p.m",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              ],),
              trailing: Icon(Icons.phone,
              color: Colors.green,
              ),
            );
          }),
      floatingActionButton: 
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //           FloatingActionButton(
          //   backgroundColor: Colors.green,
          //   child: Icon(Icons.video_call),
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => AddCall()));
          //   },
          // ),
          // SizedBox(height:15),
          FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add_call),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddCall()));
            },
          ),

        ],
      ),
    );

  }
}