import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var hide = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  passwordHide() {
    setState(() {
      hide = !hide;
    });
  }

  loginUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    var email = emailController.text;
    var password = passwordController.text;

    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final DocumentSnapshot snapshot = await db
          .collection("users")
          .doc(user.user!.uid)
          .get(); // UserCredential and DocumentSnapshot is classes just use fot the auto complete purpose of code,it is not necessarily needed.
final userData=snapshot.data();//it will assign complete user array from db
 print("Snapshot : ${userData}") ;
      print("User logged in");

      emailController.clear();
      passwordController.clear();

      Navigator.of(context).pushNamed("/home",arguments: userData); //navigate through routing

    } catch (e) {
      print("Error ${e}");

      showDialog(context: context,builder:(BuildContext context ){
        return AlertDialog(
          content: Text("error:${e}"),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LOGIN FORM")),
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
                  onTap: loginUser, child: Text("Forgot Password?")),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: ElevatedButton(
                  onPressed: loginUser,
                  child: Text("LOGIN"),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/register");
                },
                child: Text("dont have an account? Click to Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
