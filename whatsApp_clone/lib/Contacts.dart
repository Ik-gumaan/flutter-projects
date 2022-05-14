import 'package:flutter/material.dart';

import 'Camera.dart';
import 'ChatInbox.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  // var contactsArr = [
    
  //   "New group",
  //   "New contact",
  //   "sada",
  //   "asda",
  //   "sadas",
  //   "asda",
  //   "asdasd",
  //   "asdasd",
  //   "sada",
  //   "asda",
  //   "sadas",
  //   "asda",
  //   "asdasd",
  //   "asdasd",
  //   "sada",
  //   "asda",
  //   "sadas",
  //   "asda",
  //   "asdasd",
  //   "asdasd"
  // ];

var contactsArr = [
  {
    "image":"assets/images/cr7.jpg",
    "name":"New group",
    "status":"",
  },
  {
    "image":"assets/images/cr7.jpg",
    "name":"New contact",
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
                      // controller: Controller.text("data"),
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
                            "${contactsArr.length} contacts",
                            style: TextStyle(fontSize: 12),
                          ),
                        ]),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: searchFunc
                      ,child: Icon(Icons.search)),
                    SizedBox(width: 10),
                    Icon(Icons.more_vert_sharp),
                  ],
                )
              ]),

      ),
      body: ListView.builder(
          itemCount: contactsArr.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>ChatInbox(chatUserData:contactsArr[index])));

              } ,
                          child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("${contactsArr[index]['image']}"),
                  radius: 25,
                ),
                title: Text(
                  "${contactsArr[index]['name']}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "${contactsArr[index]['status']}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                trailing: contactsArr[index]['name'] == "New contact"
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Camera()));
                        },
                        child: Icon(Icons.qr_code))
                    : Text(""),
              ),
            );
          }),
    );
  }
}
