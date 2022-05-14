import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var userData = {
    "name": "Cristiano Ronaldo",
    "userName": "CristianoRonaldo7",
    "email": "cristiano_ronaldo7@gmail.com",
    "phone": "+92 300 0000000",
    "accountId": "127826728282",
    "dOB": "20/2/1987",
    "gender": "Male",
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: ListView(
          children: [
            Container(
              height: 230,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end ,
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryVariant,
                            child:Text("CR",style: TextStyle(fontWeight:FontWeight.w500 ,color:  Theme.of(context).colorScheme.onSecondary,),),
                      ),
                    ]),
                    SizedBox(height: 10),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/cr7.jpg"),
                    ),
                    SizedBox(height: 10),
                    Text("${userData['name']}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
            ListTile(
              // tileColor: Colors.black87,
              title: Text("Account Details",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.verified_user_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              // tileColor: Colors.black87,
              title: Text("Username",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              subtitle: Text("${userData['userName']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              // tileColor: Colors.black87,
              title: Text("Email Address",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              subtitle: Text("${userData['email']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.phone_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              // tileColor: Colors.black87,
              title: Text("Phone Number",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              subtitle: Text("${userData['phone']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.perm_identity_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              // tileColor: Colors.black87,
              title: Text("Account ID",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              subtitle: Text("${userData['accountId']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.perm_contact_calendar_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              // tileColor: Colors.black87,
              title: Text("Date of Birth",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              subtitle: Text("${userData['dOB']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
            ),
            ListTile(
              leading: userData['gender'] == 'Male'
                  ? Icon(
                      Icons.male,
                      color: Theme.of(context).colorScheme.onSecondary,
                    )
                  : userData['gender'] == 'Female'
                      ? Icon(
                          Icons.female,
                          color: Theme.of(context).colorScheme.onSecondary,
                        )
                      : Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),

              // tileColor: Colors.black87,
              title: Text("Gender",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              subtitle: Text("${userData['gender']}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
