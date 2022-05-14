import 'package:flutter/material.dart';

class A extends StatefulWidget {

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
TextEditingController texttStatusController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [

          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            
            child: TextField(
              keyboardType: TextInputType.text,
              controller: texttStatusController,
              maxLines: 15,
              maxLength: 700,
              autofocus: true,
              decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  hintText: 'Type Status here...'),
                  
            ),
          ),
        ],),
    );

  }
}