import 'dart:convert';//for jsonDecode

import "package:flutter/material.dart";
import 'package:http/http.dart' as http; //for Api usage Html Package

class ApiTest extends StatefulWidget {
  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  getUsersData() async {
    //aync to run complete method bcz due to slow internet sometimes data is not complete
    var usersArr = [];
    var res = await http.get(Uri.https("jsonplaceholder.typicode.com",
        "users")); //await is for to wait until it executes
    var jsonData = jsonDecode(res.body); //decoding api to data

    for (var i in jsonData) {
      //here i is iterative element
      UserModel user = UserModel(
          i['name'], i['username'], i['company']['name']); //using class to save data
      usersArr.add(user); //adding data to users array/list
    }
    // print(usersArr);
    return usersArr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: ElevatedButton(onPressed: getUsersData, child: Text("Get DATA")),
      // ),
      body: FutureBuilder( // FutureBuilder used when calling Api's or getting data from internet/online
          future: getUsersData(),
          builder: (context, snapshot) {
            // snapshot is a iterative variable (standard)
            if (snapshot.data == null) {
              return Container(
                child: Text("Api Array is empty"),
              );
            } 
            else {
              return
              // Text("Snapshot Data: ${snapshot.data}"); 
              ListView.builder(
                  // itemCount: snapshot.data.length,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // title: Text("SnapShots: ${snapshot.data[index].name}"),
                      title: Text("\$snapshot.data[index]"),
                    );
                  });
            }
          }),
    );
  }
}

class UserModel {
  var name;
  var userName;
  var companyName;

  UserModel(this.name, this.userName, this.companyName); //dart constructor

}
