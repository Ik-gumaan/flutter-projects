import "package:flutter/material.dart";
import 'Camera.dart';
import 'ChatInbox.dart';
import 'Contacts.dart';

class AddCall extends StatefulWidget {
  @override
  _AddCallState createState() => _AddCallState();
}

class _AddCallState extends State<AddCall> {
  var addCallContactsArr = [
    {
      "image": "assets/images/cr7.jpg",
      "name": "New group call",
      "status": "",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "New contact",
      "status": "",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "asim",
      "status": "i m here",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "sajjad",
      "status": "humanist",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "qadeer",
      "status": "i m superstar",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "farhan",
      "status": "Mr. Jhonny",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "Saeed",
      "status": "Chandio sahb",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "Touseer",
      "status": "Ertugal here...",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "Sharjeel",
      "status": "I m an idiot",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "Imran Brohi",
      "status": "sasta comedian",
    },
    {
      "image": "assets/images/cr7.jpg",
      "name": "Shakir",
      "status": "k",
    },
  ];

  var searchVar = false;

  searchFunc() {
    setState(() {
      searchVar = !searchVar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: searchVar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
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
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select Contacts"),
                          Text(
                            "${addCallContactsArr.length} contacts",
                            style: TextStyle(fontSize: 12),
                          ),
                        ]),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: searchFunc, child: Icon(Icons.search)),
                    SizedBox(width: 10),
                    Icon(Icons.more_vert_sharp),
                  ],
                )
              ]),
      ),
      body: ListView.builder(
          itemCount: addCallContactsArr.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatInbox(
                            chatUserData: addCallContactsArr[index])));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("${addCallContactsArr[index]['image']}"),
                  radius: 25,
                ),
                title: Text(
                  "${addCallContactsArr[index]['name']}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "${addCallContactsArr[index]['status']}",
                  style: TextStyle(
                    fontSize: 12,
                    backgroundColor: Colors.brown,
                  ),
                ),
                trailing: addCallContactsArr[index]['name'] == "New group call"
                    ? Text("")
                    : addCallContactsArr[index]['name'] == "New contact"
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Camera()));
                            },
                            child: Icon(Icons.qr_code))
                        : Container(
                            width: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.video_call,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
              ),
            );
          }),
    );
  }
}
