import 'package:flutter/material.dart';
import 'package:hi/Contacts.dart';
import 'package:hi/ChatInbox.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var chatArr = [
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
    "name":"Sharjeel",
    "status":"I m an idiot",
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatArr.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatInbox(chatUserData:chatArr[index])));
                   
              },
              child: ListTile(
                
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("${chatArr[index]["image"]}"),
                    radius: 30,
                  ),
                  title: Text(
                    "${chatArr[index]["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text("${chatArr[index]["status"]}"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "1:51 p.m",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 10,
                          child: Center(
                            child: Text(
                              "4",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )),
                                      // Divider(),
        
                    ],
                  )
                  ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.chat),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Contacts()));
              
        },
      ),
    );
  }
}
