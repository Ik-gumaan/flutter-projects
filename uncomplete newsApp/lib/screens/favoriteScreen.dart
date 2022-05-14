import 'package:flutter/material.dart';

import 'login.dart';

class FavScreen extends StatefulWidget {

Map data;
FavScreen({required this.data});


  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
appBar:AppBar(
          centerTitle: true,
          leading: Icon(Icons.menu),
          title:Text("FAVOURITES"),
 
        // bottom: TabBar(
        //   // controller: TabController(vsync: this, length: 4),
        //   isScrollable: true,
        //         indicatorSize: TabBarIndicatorSize.label,
        //         indicatorColor: Theme.of(context).colorScheme.onPrimary,
        //         tabs: [
        //           Container(
        //             width: MediaQuery.of(context).size.width / 3,
        //             child: Tab(child: Text("Headlines")),
        //           ),
        //           Container(
        //             width: MediaQuery.of(context).size.width / 3,
        //             child: Tab(child: Text("Sports")),
        //           ),
        //           Container(
        //             width: MediaQuery.of(context).size.width / 3,
        //             child: Tab(child: Text("Stock Martket")),
        //           ),
        //           Container(
        //             width: MediaQuery.of(context).size.width / 3,
        //             child: Tab(child: Text("Other")),
        //           ),
        //         ]),


            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Icon(Icons.login)),
              SizedBox(width: 10),
              // GestureDetector(onTap:(){},child: Icon(Icons.logout))
            ],
        ),
        body:Text("Fav"),
    );
  }
}