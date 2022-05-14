import 'package:flutter/material.dart';

class ChatInbox extends StatefulWidget {

final Map chatUserData;
ChatInbox({required this.chatUserData});

  @override
  _ChatInboxState createState() => _ChatInboxState();
}

class _ChatInboxState extends State<ChatInbox> {
  var msg = "";
  var msgsArr = [];
  var nameHolder = TextEditingController();

  msgSavedToArr() {
    if (msg != "") {
      setState(() {
        msgsArr.add(msg);
        msg = "";
        nameHolder.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 75,
          backgroundColor: Colors.green,
          leading: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("${widget.chatUserData['image']}"),
              ),
            ],
          ),
          title: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.chatUserData['name']}"),
                    Text(
                      "online",
                      style: TextStyle(fontSize: 12),
                    ),
                  ]),
              Row(children: [
                Icon(Icons.video_call),
                SizedBox(width: 10),
                Icon(Icons.call),
                SizedBox(width: 10),
                Icon(Icons.more_vert_sharp),
              ]),
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: msgsArr.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // SizedBox(height: 10),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(5),

                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),

                        child: IntrinsicHeight(
                          child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: 
                                  Text(
                                    msgsArr[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 10),

                                  // Row(
                                    // children:[
                                // Expanded(
                                  // child: 
                                  Text(
                                    "06:45 p.m ",
                                    style: TextStyle(
                                      // backgroundColor: Colors.green,
                                      color: Colors.white,
                                      fontSize: 11,
                                      // fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                // ),
Icon(Icons.check ,size:11,color:Colors.white),
                                    // ],
                                  // ),

                              ]),
                        ),

                        //     Text(msgsArr[index],
                        // style: TextStyle(
                        //   color: Colors.white,
                        //   fontSize: 16,
                        //   fontWeight: FontWeight.w400,
                        // ),),
                        // // SizedBox(width:10),
                        // Text("06:45 p.m",
                        // style: TextStyle(
                        //   // backgroundColor: Colors.green,
                        //   color: Colors.white,
                        //   fontSize: 8,
                        //   // fontWeight: FontWeight.w400,
                        // ),),
                      ),
                    ],
                  );
                }),
          ),

          // for(var i=msgsArr.length;i>=0;i--){
          //   return Text(msgsArr[i]);
          // }
          // ListView.builder(itemCount:msgsArr.length,itemBuilder:(builder,index){
          //     return ListTile(
          //       title: Text(msgsArr[index]),
          //     );
          // }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .8,
                child: TextField(
                  cursorColor: Colors.green,
                  autofocus: true,
                  controller: nameHolder,
                  decoration: InputDecoration(
                    hintText: ("Type a message..."),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  onChanged: (value) {
                    msg = value;
                  },
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width * .15,
                // height: MediaQuery.of(context).size.height * .08,
                width: 50,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          // side: BorderSide(color: Colors.red)
                        ))),
                    onPressed: msgSavedToArr,
                    child: Icon(Icons.send)),
              )
            ],
          )
        ],
      ),
    );
  }
}
