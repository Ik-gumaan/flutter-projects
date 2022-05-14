// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_mini_hackathon_flutter/screens/signup.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController code = TextEditingController();

  forgotPassword() async {
    print("\nEmail:${emailController.text}");

//     FirebaseAuth auth = FirebaseAuth.instance;
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     var email = emailController.text;
//     var password = passwordController.text;

//     try {
//       final UserCredential user = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       final DocumentSnapshot snapshot = await db
//           .collection("users")
//           .doc(user.user!.uid)
//           .get(); // UserCredential and DocumentSnapshot is classes just use fot the auto complete purpose of code,it is not necessarily needed.
// final userData=snapshot.data();//it will assign complete user array from db
//  print("Snapshot : ${userData}") ;
//       print("User logged in");

//       emailController.clear();
//       passwordController.clear();

//       // Navigator.of(context).pushNamed("/home",arguments: userData); //navigate through routing

//     } catch (e) {
//       print("Error ${e}");

//       showDialog(context: context,builder:(BuildContext context ){
//         return AlertDialog(
//           content: Text("error:${e}"),
//         );
//       });
//     }
  }

  verifyForgotPasswordCode() {
    print("\nCode:${code.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FORGOT PASSWORD"),
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
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  autofocus: true,
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Email Address'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: ElevatedButton(
                  onPressed: forgotPassword,
                  child: Text("GET CODE"),
                ),
              ),
              SizedBox(
                height: 50,
              ),  Center(
                child: Text(
                    "Check your email account to get the code and Enter it below:"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                    // textBaseline:TextBaseline. 
 
                  ),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  autofocus: true,
                  controller: code,
                  decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.code),
                      border: OutlineInputBorder(),
                      hintText: 'Enter Code'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: ElevatedButton(
                  onPressed: verifyForgotPasswordCode,
                  child: Text("Enter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
