import 'package:flutter/material.dart';

class ListTileTest extends StatefulWidget {
  @override
  _ListTileTestState createState() => _ListTileTestState();
}

class _ListTileTestState extends State<ListTileTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//Calling user defined Widgets
        myWidget1("Promo","assets/images/cr7.jpg","erroe","1:19 p.m","3"),
        myWidget1("Actor123","assets/images/cr7.jpg","missing","2:00 p.m","4"),
        myWidget1("CR7","assets/images/cr7.jpg","footballer","1:09 p.m","6"),
        myWidget1("Promo","assets/images/cr7.jpg","erroe","1:19 p.m","3"),
        myWidget1("Actor123","assets/images/cr7.jpg","missing","2:00 p.m","4"),
        myWidget1("CR7","assets/images/cr7.jpg","footballer","1:09 p.m","6"),
        myWidget1("Promo","assets/images/cr7.jpg","erroe","1:19 p.m","3"),
        myWidget1("Actor123","assets/images/cr7.jpg","missing","2:00 p.m","4"),

    ]);
  }
}





// ------------------------Making Widgets============================
// -------------------------Passing arguments and parameters---------------------
Widget myWidget1(var name,var image,var subtitle,var time,var msgs){
    return      
     ListTile(
          leading: CircleAvatar(backgroundImage:AssetImage(image) ,radius:40 ,),
          title: Text(name),
          subtitle: Text(subtitle),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              Text(time),
              CircleAvatar(radius:6,backgroundColor: Colors.green,child: Text(msgs,style: TextStyle(fontSize: 1),),),
              ]
              )
              );

}


