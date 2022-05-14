import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of the application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Shared preferences demo',
//       home: MyHomePage(title: 'Shared preferences demo'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _str = 'hello';

var strArr=["ali","al","has"];
var i=0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _str = (prefs.getString('_str') ?? "hell");
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if(i<strArr.length){
      _str = (prefs.getString('_str') ?? "hello ") + strArr[i++];
      prefs.setString('counter', _str);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      ListView.builder(
        itemCount: strArr.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.orange[100],
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.white),)),

            child: ListTile(
              // tileColor: Colors.orange[50],
              title: Text("${strArr[index]}",
                style: TextStyle(color: Colors.black),
              ),
                ),
          );

        }
      ),




      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),

      //       Text(
      //         '$_str',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}