// apiKey=9d92b77ad3da46339185a14972111be0
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'all.dart';
import 'components/myTheme.dart';
import 'screens/bottomNavBarState.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/splashScreen.dart';

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
      theme:CustomTheme.lightTheme,
      darkTheme:CustomTheme.darkTheme,
      themeMode: currentTheme.currentMode,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("SomethingWentWrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }

          return CircularProgressIndicator();
        },
      ),
      routes: {
        "/login": (context) => Login(),
        "/signup": (context) => Signup(),
        "/home": (context) => MyBottomNavBarState(data:{}),
      },
    );
  }
}


// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//     // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   void initState(){
//     super.initState();
//     currentTheme.addListener((){
//       setState((){});
//     });
//   }

//   Widget build(BuildContext context) {

//     //    return MaterialApp(
//     //   debugShowCheckedModeBanner: false,
//     //   theme:CustomTheme.lightTheme,
//     //   darkTheme:CustomTheme.darkTheme,
//     //   themeMode: currentTheme.currentMode,
//     //   home: FutureBuilder(
//     //     future: _initialization,
//     //     builder: (context, snapshot) {
//     //       if (snapshot.hasError) {
//     //         return Text("SomethingWentWrong");
//     //       }

//     //       if (snapshot.connectionState == ConnectionState.done) {
//     //         return All();
//     //       }

//     //       return Center(child: CircularProgressIndicator());
//     //     },
//     //   ),
      // routes: {
      //   "/login": (context) => Login(),
      //   "/register": (context) => Register(),
      //   "/home": (context) => Home(),
      // },
//     // );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(
//       //   primarySwatch: Colors.purple,
//       // ),
//       theme:CustomTheme.lightTheme,
//       darkTheme:CustomTheme.darkTheme,
//       themeMode: currentTheme.currentMode,

//       home: All(),
//       // home: Text("HELLO"),
//     );
//   }
// }
