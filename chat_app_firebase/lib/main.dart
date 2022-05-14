import 'package:flutter/material.dart';
import 'components/theme/myTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/forTest.dart';
import 'screens/splashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentMode,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("SomethingWentWrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
            // return ForTest();
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
