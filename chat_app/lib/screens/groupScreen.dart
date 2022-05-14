import 'package:chat_app/screens/chatInbox.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  var groupArr = [
    {
      "image": "assets/images/cr7.jpg",
      "name": "Software 2k19",
      "lastMsg": "i m here",
      "unSeenMsgsCount": 0,
    },
    {
      "image": "assets/images/macbook.jpg",
      "name": "FGIENS",
      "lastMsg": "i m here",
      "unSeenMsgsCount": 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: groupArr.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatInbox(chatUserData: groupArr[index])));
              },
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("${groupArr[index]["image"]}"),
                    radius: 30,
                  ),
                  title: Text(
                    "${groupArr[index]["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "${groupArr[index]["lastMsg"]}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "1:51 p.m",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                          groupArr[index]['unSeenMsgsCount']!=0 ?CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              radius: 9,
                              child: Center(
                                  child: Text(
                                    "${groupArr[index]['unSeenMsgsCount']}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                ),
                              )):Text(""),
                      // Divider(),
                    ],
                  )),
            );
          }),
    );
  }
}
