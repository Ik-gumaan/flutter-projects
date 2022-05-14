import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Login.dart';
import 'Register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("SomethingWentWrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Home();
          }

          return Text("Loading");
        },
      ),
      routes: {
        "/login": (context) => Login(),
        "/register": (context) => Register(),
        "/home": (context) => Home(),
      },
    );
  }
}
