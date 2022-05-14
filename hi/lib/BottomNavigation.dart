import 'package:flutter/material.dart';



class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
 
  int currentTab = 0;
  Widget currentScreen = Screen1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(bucket: PageStorageBucket(), child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        // notchMargin: 50,
        color: Colors.red[900],
        child: Container(
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = Screen1();
                        currentTab = 0;
                      });
                    },
                    child: Icon(Icons.home,
                        color: currentTab == 0 ? Colors.white : Colors.black)),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = Screen2();
                        currentTab = 1;
                      });
                    },
                    child: Icon(Icons.favorite,
                        color: currentTab == 1 ? Colors.white : Colors.black)),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = Screen3();
                        currentTab = 2;
                      });
                    },
                    child: Icon(Icons.search,
                        color: currentTab == 2 ? Colors.white : Colors.black)),
                MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = Screen4();
                        currentTab = 3;
                      });
                    },
                    child: Icon(Icons.person,
                        color: currentTab == 3 ? Colors.white : Colors.black)),
              ]),
        ),
      ),
    );
  }
}






// -----------------Screen1----------------
class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Screen 1")),
    );
  }
}





// -----------------Screen2----------------
class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Screen 2")),
    );
  }
}



// -----------------Screen3----------------
class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Screen 3")),
    );
  }
}



// -----------------Screen4----------------
class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Screen 4")),
    );
  }
}
