import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget {
  @override
  _ListViewTestState createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> {
  var lst = ["hi", "hello", "bye"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
          // ListView(
            // scrollDirection: Axis.horizontal, //for horizontal scroll
          //   physics: NeverScrollableScrollPhysics, //some times scroll dont work so this is used
          //   shrinkWrap: true, //use when length is not defined //mostly use with grid and list view
          // ),
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lst[index]),
                subtitle: Text("greetings"),
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/cr7.jpg"),
                ),
                trailing: Icon(Icons.add),
              );
            }),
      ),
    );
  }
}
