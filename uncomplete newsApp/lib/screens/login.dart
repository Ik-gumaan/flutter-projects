// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_mini_hackathon_flutter/screens/bottomNavBarState.dart';
import 'package:news_app_mini_hackathon_flutter/screens/forgotPasswordScreen.dart';
import 'package:news_app_mini_hackathon_flutter/screens/signup.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var hide = true;
late final Map data; 
var loggedIn=false; 
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  passwordHide() {
    setState(() {
      hide = !hide;
    });
  }

  login() async {
    print("\nEmail:${emailController.text}\nPass:${passwordController.text}");

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
      final userData =
          snapshot.data(); //it will assign complete user array from db
      print("Snapshot : ${userData}");
      // Map userData={
      //           "fullname": userData,
      //   "gender": gender,
      //   "date of birth": dob,
      //   "country": country,
      //   "phone number": phone,
      //   "email": email,
      //   "password": password,
      // };
      loggedIn=true;
      print("User logged in");

      emailController.clear();
      passwordController.clear();


      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MyBottomNavBarState(data:{"userData":userData,"loggedIn":loggedIn},)));

      // Navigator.of(context).pushNamed("/home",arguments: userData); //navigate through routing

    } catch (e) {
      print("Error ${e}");

      showDialog(
          context: context,
          builder: (BuildContext context) {
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
        title: Text("LOGIN FORM"),
        centerTitle: true,
        // backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
// with custom text
// Container(
// color:Colors.red,
// child:SignInButton(
//   Buttons.Google,
//   text: "Google",
//   onPressed: () {},
// ),
// ),

              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  autofocus: true,
                  controller: emailController,
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
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  autofocus: true,
                  controller: passwordController,
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text("Forgot Password?")),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: ElevatedButton(
                  onPressed: login,
                  child: Text("LOGIN"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("OR Connect using"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    // color: Colors.blue,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF0D47A1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook),
                          SizedBox(
                            width: 2,
                          ),
                          Text("Facebook"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    // color: Colors.red,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //  Icon(FontAwesomeIcons.google),
                          Icon(Icons.email),
                          SizedBox(
                            width: 2,
                          ),
                          Text("Google"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?"),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        " Signup",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
