import 'package:flutter/material.dart';
import 'package:news_app_mini_hackathon_flutter/components/newsApiServices.dart';
// import 'package:news_app_mini_hackathon_flutter/components/homeScreenAppBar.dart';
import 'package:news_app_mini_hackathon_flutter/screens/favoriteScreen.dart';
import 'package:news_app_mini_hackathon_flutter/screens/homeScreen.dart';
import 'package:news_app_mini_hackathon_flutter/screens/profileScreen.dart';
import 'package:news_app_mini_hackathon_flutter/screens/searchSreen.dart';
import 'package:dio/dio.dart';

class MyBottomNavBarState extends StatefulWidget {

Map data;
MyBottomNavBarState({required this.data});

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBarState> {

  Widget currentScreen = HomeScreen(data:{});


  var _currentIndex = 0;

var allNews=[];
// var newsObj={
// "articleName":
// "author":
// };

//  late TabController tabController;

  void initState() {

    // tabController =
    //     TabController(length: 4, vsync: this, initialIndex: 0);
    // super.initState();
  currentScreen = HomeScreen(data:{"loggedIn":widget.data,"userData":widget.data["userData"]});
    getNewsData();
  }




void getNewsData() async{
  var dio = Dio();
  // final response = await dio.get("https://newsapi.org/v2/everything?q=tesla&from=2021-09-06&sortBy=publishedAt&apiKey=9d92b77ad3da46339185a14972111be0");
  // final response = await dio.get("http://api.mediastack.com/v1/news?access_key=e2da092d1ac8be2f29c01b5dfeb12e07");
  final response = await dio.get("http://api.mediastack.com/v1/news?access_key=dcd873f15d1558648d3b41615ec11ccc");

for( var i=0; i<response.data['data'].length;i++){
  if(response.data['data'][i]['language']=="en"){
  print(response.data['data'][i]);
  }
}
  // print(response.data['data'][0]);
  
  // print(response.data['data'][0]['title']);
  // print(response.data['data'][0]['cateogory']);
  // print(response.data["articles"][0]);
  // allNews=response.data["articles"];


// print("------------>All${allNews}");
// GetNews(status:response.data["status"],
// totalResults:response.data["total results"],
// articles:response.data["articles"]);
//   // print(response.data["articles"]);
}

  @override
  Widget build(BuildContext context) {
// Object? userData=widget.userData;
print("NAVBMAR STATE==========>${widget.data}");
    return
    //  DefaultTabController(
          // length: 4,
          // child: 
          Scaffold(
        // appBar:HomeScreenAppBar(), 
        // appBar:AppBar(title:Text("Hoe")), 
        // HomeScreenAppBar(),
        body:
        // Text("1"), 
        PageStorage(bucket: PageStorageBucket(), child: currentScreen
        ),
        
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor:
              Theme.of(context).colorScheme.onPrimary.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
              value == 0
                  ? currentScreen = HomeScreen(data:{"loggedIn":widget.data,"userData":widget.data["userData"]})
                  : value == 1
                      ? currentScreen = SearchScreen(data:{"loggedIn":widget.data,"userData":widget.data["userData"]})
                      : value == 2
                          ? currentScreen = FavScreen(data:{"loggedIn":widget.data,"userData":widget.data["userData"]})
                          : currentScreen = ProfileScreen(data:{"loggedIn":widget.data,"userData":widget.data["userData"]});
              print("Index=>${_currentIndex} ${currentScreen}");

            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Search'),
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              title: Text('Favourite'),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.account_circle),
            ),
          ],
        // ),
      ),
    );
  }
}
