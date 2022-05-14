import 'package:flutter/material.dart';

class TabAppBar extends StatefulWidget {
  @override
  _TabAppBarState createState() => _TabAppBarState();
}

class _TabAppBarState extends State<TabAppBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title:Text("App") ,
          bottom: TabBar(tabs:[
            Tab(child:Text("Login")),
            Tab(child:Text("Register")),
          ]),
        ),
      
      body: TabBarView(children:[
        Login(),
        Register(),
      ]),

      ),
    );
  }
}

// --------------------------login class====================
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Login class"),
    );
  }
}


// ------------------------Register class===================
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Register class"),     
    );
  }
}