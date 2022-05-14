import 'package:flutter/material.dart';

class DrawerAppBar extends StatefulWidget {
  @override
  _DrawerAppBarState createState() => _DrawerAppBarState();
}

class _DrawerAppBarState extends State<DrawerAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer AppBar"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Image.asset("assets/images/cr7.jpg"),
              ),
            ),
            // GestureDetector(onTap: (){},  //by wraping with GestureDetector we can redirected it to other page
                          // child: 
                          ListTile(
                title: Text("USER1"),
              ),
            // ),
           
          ],
        ),
      ),
    );
  }
}
