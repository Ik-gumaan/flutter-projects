import 'package:chat_app/components/myTheme.dart';
import 'package:flutter/material.dart';

import 'all.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState(){
    super.initState();
    currentTheme.addListener((){
      setState((){});
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.purple,
      // ),
      theme:CustomTheme.lightTheme,
      darkTheme:CustomTheme.darkTheme,
      themeMode: currentTheme.currentMode,
      
      home: All(),
    );
  }
}
