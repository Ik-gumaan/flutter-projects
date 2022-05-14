import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var hide = true;
  

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  passwordHide() {
    setState(() {
      hide = !hide;
    });
  }

  registerUser() async {
    FirebaseFirestore db =
        FirebaseFirestore.instance; //instance of firebase firestore(database)
    FirebaseAuth auth = FirebaseAuth.instance; //instance of firebase auth
    var username = usernameController.text;
    var email = emailController.text;
    var password = passwordController.text;

    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await db.collection("users").doc(user.user!.uid).set({
        "email": email,
        "username": username,
      });
      print("User Registered succesfully....");
      
      Navigator.of(context).pushNamed("/login");
  
    } catch (e) {
      print("Error ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("REGISTRATION FORM")),
        // backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: usernameController,
                  maxLines: 1,
                  autofocus: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(),
                      hintText: 'Full Name'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
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
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
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
              GestureDetector(
                  onTap: registerUser, child: Text("Forgot Password?")),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: ElevatedButton(
                  onPressed: registerUser,
                  child: Text("REGISTER"),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/login");
                },
                child: Text("have an account? Click to Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
