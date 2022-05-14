import 'package:flutter/material.dart';

import 'login.dart';

class ProfileScreen extends StatefulWidget {

    Map data;
  ProfileScreen({required this.data});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  var myProfileObj = {
    "Name": "Cristiano Ronaldo",
    "Gender": "Male",
    "DOB": "01-02-1981",
    "Country": "Portugal",
    "Email": "cr7@gmail.com",
    "Phone": "+351 304 1234560",
    // "Password":"123",
  };

void initState(){
    if(widget.data['userData']!=null){
     myProfileObj = {
    "Name": widget.data['userData']['fullname'],
    "Gender": widget.data['userData']['gender'],
    "DOB": widget.data['userData']['date of birth'],
    "Country": widget.data['userData']['country'],
    "Email": widget.data['userData']['email'],
    "Phone": widget.data['userData']['phone number'],
    // "Password":"123",
  };
    }
}

  @override
  Widget build(BuildContext context) {
    // return print("PROFIMLE SCREN==========>${widget.data}");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.menu),
        title: Text("PROFILE"),

            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Icon(Icons.login)),
              SizedBox(width: 10),
              // GestureDetector(onTap:(){},child: Icon(Icons.logout))
            ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                // height: 220,
                width: MediaQuery.of(context).size.width * 1,
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     CircleAvatar(
                    //       radius: 20,
                    //       child:Icon(Icons.logout),
                    //     ),
                    //                         SizedBox(width: 10),
                    //   ],
                    // ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/cr7.jpg"),
                    ),
                    SizedBox(height: 10),
                    Text(
                        // "${widget.userData[Name]}",
                        "${myProfileObj['Name']}",
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
            ),
            ListTile(
              // tileColor: Theme.of(context).colorScheme.secondaryVariant,
              title: Text("Account Details",
                  style: TextStyle(
                    // color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  )),
            ),

            ListTile(
              leading: myProfileObj['Gender'] == "Male"
                  ? Icon(
                      Icons.male,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    )
                  : myProfileObj['Gender'] == "Female"
                      ? Icon(
                          Icons.male,
                          color: Theme.of(context).colorScheme.primaryVariant,
                        )
                      : Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.primaryVariant,
                        ),
              // tileColor: Colors.black87,
              title: Text("Gender",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
              subtitle: Text("${myProfileObj['Gender']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.date_range,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              // tileColor: Colors.black87,
              title: Text("Date of Birth",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
              subtitle: Text("${myProfileObj['DOB']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              // tileColor: Colors.black87,
              title: Text("Country",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
              subtitle: Text("${myProfileObj['Country']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              // tileColor: Colors.black87,
              title: Text("Email",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
              subtitle: Text("${myProfileObj['Email']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              // tileColor: Colors.black87,
              title: Text("Phone Number",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
              subtitle: Text("${myProfileObj['Phone']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primaryVariant,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}