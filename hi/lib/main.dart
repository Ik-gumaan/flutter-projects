import 'package:flutter/material.dart';
import 'package:hi/MediaQueryTest.dart';
import 'package:hi/Navigation.dart';
import 'BottomNavigation.dart';
import 'BoxStyling.dart';
import 'DrawerAppBar.dart';
import 'ListTileTest.dart';
import 'ListViewTest.dart';
import 'SettingStates.dart';
import 'TabAppBar.dart';
import 'TextStyling.dart';
import 'StackWidget.dart';

import 'GridViewTest.dart';
import 'ApiTest.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp()); //runApp(widget/className)
}

class MyApp extends StatelessWidget {
  //default flutter class name: MyApp otherwise error due to test/widget_test.dart
  
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false, // to remove banner on top-right
        
        //change Container to MaterialApp coz MaterialApp is a class which supports more widgets than container
      
       home: 
      //  Register(),
         
                // ListViewTest(),
                // GridViewTest(),
                // DrawerAppBar(),
                TabAppBar(),
                // SettingStates(),
                // BottomNavigation(),
        //  Scaffold(
//             //MaterialApp(home:(anything)) //Scaffold(body:(anything)) //Scaffold()  //Scaffold : like body in html

//             // body: Text("HELLO WORLD"), //Scaffold takes 2 things: Appbar and body

//             // body:Container( //Container can take one child means 1 widget
//             //     height:100, width:100,color:Colors.blue,
//             //     child: Text("CoNTAINER"),

//             // body: Column( //Column take children means 1 or more than 1 widgets(verticrally)
//             // crossAxisAlignment: CrossAxisAlignment.center,//for column = left to right alignment,for row = top to bottom alignment,
//             //   children: [
//             //     Text("column1"),
//             //     SizedBox(height:10, ), //for spacing in between SizedBox({Key? key, double? width, double? height, Widget? child})
//             //     Text("column2"),
//             //     Text("column3"),
//             //     Text("column4"),
//             //   ],

//             // body: Row( //Row take children means 1 or more than 1 widgets(horizontally)
//             //    mainAxisAlignment:MainAxisAlignment.spaceAround,// for row = left to right alignment,for column = top to bottom alignment,
//             //   children: [
//             //     Text("column1"),
//             //     Text("column2"),
//             //     SizedBox(width:10, ), //for spacing in between SizedBox({Key? key, double? width, double? height, Widget? child})
//             //     Text("column3"),
//             //     Text("column4"),

//             //   ],
//             // ),

//             // body: SingleChildScrollView(  //to make scrollable
//             //   child: Center(//widget to center the content
//             //     child: Column(
//             //       children: [
//             //         Text("Login Form"),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //         Container(height: 100, width: 500, color: Colors.yellow),
//             //         SizedBox(height: 20),
//             //       ],
//             //     ),
//             //   ),
//             // ),

// // ---------------------------------------------------------------------------------------------------------
//             // -----------------LOGIN FORM-----------------

//             // appBar: AppBar(
//             //     //App Bar
//             //     title: Center(child: Text("Login Form"))),
//             // body: Center(
//             //   child: Column(
//             //     children: [

//             //       SizedBox(
//             //         height: 100,
//             //       ),
//             //       Container(
//             //         width: 200,
//             //         child: TextField(),
//             //       ),

//             //       SizedBox(
//             //         height: 10,
//             //       ),
//             //       Container(
//             //         width: 200,
//             //         child: TextField(),
//             //       ),

//             //       SizedBox(
//             //         height: 30,
//             //       ),
//             //       ElevatedButton(
//             //           onPressed: () {}, child: Text("Login")), // Elevated Button

//             //     ],
//             //   ),
//             // ),

//             body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Home(), //calling class within same file
//                 // SizedBox(
//                 //   height: 100,
//                 // ),
//                 // BoxStyling(), //calling class from different file
//                 // TextStyling(),
//                 // StackWidget(),
//                 // MediaQueryTest(),
//                 // Navigation(),
//                 // ListTileTest(),
//  
              // ],
        //     ),
        //   ),
        // ))

        );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100, //for size
      backgroundColor: Colors.yellow[200],
      // backgroundImage: NetworkImage('link'), //for online image link
      backgroundImage:
          AssetImage('assets/images/cr7.jpg'), // for downloaded image
    );
  }
}
