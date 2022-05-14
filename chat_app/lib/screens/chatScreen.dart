import 'package:chat_app/screens/chatInbox.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  var chatArr = [
    {
      "image": "assets/images/cr7.jpg",
      "name": "asim",
      "lastMsg": "i m here",
      "unSeenMsgsCount": 3,
    },
    {
      "image": "assets/images/adidas.jpg",
      "name": "sajjad",
      "lastMsg": "humanist",
      "unSeenMsgsCount": 0,
    },
    {
      "image": "assets/images/ferrari.jpg",
      "name": "Sharjeel",
      "lastMsg": "I m an idiot",
      "unSeenMsgsCount": 1,
    },
    {
      "image": "assets/images/iphonex.jpg",
      "name": "farhan",
      "lastMsg": "Mr. Jhonny",
      "unSeenMsgsCount": 2,
    },
    {
      "image": "assets/images/nike.jpg",
      "name": "Saeed",
      "lastMsg": "Chandio sahb",
      "unSeenMsgsCount": 0,
    },
    {
      "image": "assets/images/oppo.jpg",
      "name": "Touseer",
      "lastMsg": "Ertugal here...",
      "unSeenMsgsCount": 0,
    },
    {
      "image": "assets/images/shirt.jpg",
      "name": "Ali",
      "lastMsg": "Ufff...",
      "unSeenMsgsCount": 0,
    },
    {
      "image": "assets/images/kit.jpg",
      "name": "Nomi",
      "lastMsg": "yo...",
      "unSeenMsgsCount": 0,
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatInbox(chatUserData: chatArr[index])));
              },
              child: Column(
                children: [
                  ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("${chatArr[index]["image"]}"),
                        radius: 25,
                      ),
                      title: Text(
                        "${chatArr[index]["name"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text("${chatArr[index]["lastMsg"]}",
                      style: TextStyle(
                          fontSize:12,
                        ),),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "1:51 p.m",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          
                          chatArr[index]['unSeenMsgsCount']!=0 ?CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              radius: 9,
                              child: Center(
                                  child: Text(
                                    "${chatArr[index]['unSeenMsgsCount']}",
                                    style: TextStyle(                                  fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                ),
                              )):Text(""),
                        ],
                      )),
                  // Divider(
                    // height: 5,
                    // color: Colors.grey[50],
                    // thickness: 1,
                  // ),
                ],
              ),
            );
          }),
    );
  }
}
