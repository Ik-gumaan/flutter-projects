import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var hide = true;

  passwordHide() {
    setState(() {
      hide = !hide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN FORM"),
        centerTitle: true,
        // backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  autofocus: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      hintText: 'Email Address'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  autofocus: true,
                  obscureText: hide, //for passwords to hide
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: passwordHide,
                        child: hide
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Password'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(onTap: () {}, child: Text("Forgot Password?")),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("LOGIN"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
