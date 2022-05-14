import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<dynamic> lst = [];
  var item = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
        
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(

        itemCount: lst.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.orange[100],
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.white),
)),
            // margin: EdgeInsets.only(top:5),
            child: ListTile(
              // tileColor: Colors.orange[50],
              title: Text(
                "${lst[index]}",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Container(
                width: 50,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    padding: EdgeInsets.all(10),
                                    color: Colors.orange,
                                    child: Center(
                                        child: Text(
                                      "Edit Item",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                  content: TextField(
                                    cursorColor: Colors.orange,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                    ),
                                    // style:StrutStyle() ,

                                    autofocus: true,
                                    onChanged: (value) {
                                      item = value;
                                    },
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.orange)),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); //for after clicking move to  homescreen immediately
                                        setState(() {
                                          lst.replaceRange(
                                              index, index + 1, {item});
                                        });
                                      },
                                      child: Text(
                                        "Edit",
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.orange,
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            lst.removeAt(index);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.orange,
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.all(10),
                        color: Colors.orange,
                        child: Center(
                            child: Text(
                          "Add Item",
                          style: TextStyle(color: Colors.white),
                        ))),
                    content: TextField(
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      autofocus: true,
                      onChanged: (value) {
                        item = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange)),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); //for after clicking move to  homescreen immediately
                          setState(() {
                            lst.add(item);
                          });
                        },
                        child: Text("Add"),
                      )
                    ],
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }
}
