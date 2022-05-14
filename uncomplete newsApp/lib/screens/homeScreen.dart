import 'package:flutter/material.dart';
import 'package:news_app_mini_hackathon_flutter/components/HomeTabs/headlines.dart';
import 'package:news_app_mini_hackathon_flutter/components/HomeTabs/popularNews.dart';
import 'package:news_app_mini_hackathon_flutter/components/HomeTabs/sportsNews.dart';
import 'package:news_app_mini_hackathon_flutter/components/HomeTabs/topStories.dart';
import 'package:news_app_mini_hackathon_flutter/components/myDrawer.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {

Map data;

HomeScreen({required this.data});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

// final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            // leading: Icon(Icons.menu),
            title: Text("HOME"),
            bottom: TabBar(
                // controller: TabController(vsync: this, length: 4),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).colorScheme.onPrimary,
                tabs: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Tab(child: Text("Top Stories")),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Tab(child: Text("Headlines")),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Tab(child: Text("Popular News")),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Tab(child: Text("Sports News")),
                  ),
                ]),
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
          drawer: MyDrawer(),
          body: TabBarView(children: [
            TopStories(),
            Headlines(),
            PopularNews(),
            SportsNews(),
          ]),
        ));
  }
}
