import 'package:chat_app/components/myDrawer.dart';
import 'package:chat_app/components/myTheme.dart';
import 'package:chat_app/screens/chatScreen.dart';
import 'package:chat_app/screens/groupScreen.dart';
import 'package:chat_app/screens/statusScreen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  var searchVar = false;

  searchFunc() {
    setState(() {
      searchVar = !searchVar;
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("HOME"),
          centerTitle: true,
                  actions: [
          GestureDetector(
            onTap:(){
              currentTheme.toggleTheme();
            },
            child:Icon(Icons.brightness_3),
          ),
        ],

          // title: searchVar
          //     ? Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           GestureDetector(
          //             onTap: searchFunc,
          //             child: Icon(Icons.arrow_back),
          //           ),
          //           SizedBox(width: 10),
          //           Container(
          //             width: MediaQuery.of(context).size.width * 0.8,
          //             child: TextField(
          //               style: TextStyle(color: Colors.white),
          //               cursorColor: Colors.white,
          //               decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 // focusedBorder: UnderlineInputBorder(

          //                 //   borderSide: BorderSide(color: Colors.white),
          //                 // ),
          //               ),
          //               autofocus: true,
          //               onChanged: (value) {
          //                 // item = value;
          //               },
          //             ),
          //           ),
          //         ],
          //       )
          //     : Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("WhatsApp"),
          //           Container(
          //             child: Row(
          //               children: [
          //                 GestureDetector(
          //                     onTap: searchFunc, child: Icon(Icons.search)),
          //                 SizedBox(width: 10),
          //                 Icon(Icons.more_vert_sharp),
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).colorScheme.onPrimary,
              tabs: [

                Container(
                  width:MediaQuery.of(context).size.width /3,
                  child: Tab(child: Text("CHATS")),
                ),

                Container(
                  width:MediaQuery.of(context).size.width /3,
                  child: Tab(child: Text("GROUPS")),
                ),

                Container(
                  width:MediaQuery.of(context).size.width /3,
                  child: Tab(child: Text("STATUS")),
                ),

              ]),
        ),

        body: TabBarView(children: [
          ChatScreen(),
          GroupScreen(),
          StatusScreen(),
        ]),
      ),
    );
  }
}
