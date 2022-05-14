import 'package:flutter/material.dart';

import 'login.dart';

class SearchScreen extends StatefulWidget {

Map data;
SearchScreen({required this.data});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchVar = false;
// Widget myLeading=Icon(Icons.menu);

  searchFunc() {
    setState(() {
      searchVar = !searchVar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.menu),
          title: Text("SEARCH"),
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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: MediaQuery.of(context).size.width * 1,
              child: TextField(
                keyboardType: TextInputType.text,
                maxLines: 1,
                // autofocus: true,
                // controller: emailController,
                decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.search),
                    suffixIcon: GestureDetector(
                                          child: Container(
                        // width: 50,
                        // height: 50,
                        margin: EdgeInsets.only(right:5),
                        padding:EdgeInsets.all(10) ,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.search,color:Theme.of(context).colorScheme.onPrimary ,),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
