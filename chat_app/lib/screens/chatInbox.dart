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

  TimeOfDay time = TimeOfDay.now();

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
          actions: [
            Icon(Icons.video_call),
            SizedBox(width: 10),
            Icon(Icons.add_call),
            SizedBox(width: 10),
            Icon(Icons.more_vert_sharp),
          ],

          // backgroundColor: Colors.green,
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
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(children: [
                            Container(child:
                              Text(
                                msgsArr[index],
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Row(
                               mainAxisAlignment:MainAxisAlignment.end,
                                  crossAxisAlignment:CrossAxisAlignment.end ,
                                 
                              children: [
                              Text(
                                time.period == DayPeriod.pm
                                    ? "${time.hourOfPeriod.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} p.m"
                                    : "${time.hourOfPeriod.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} a.m",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 11,
                                ),
                              ),
                              Icon(
                                Icons.check,
                                size: 11,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ]),
                          ])),
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Theme.of(context).colorScheme.secondaryVariant,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: 50,
                  child: TextField(
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.black,
                    ),

                    // cursorColor:
                    // Colors.green,
                    // autofocus: true,

                    controller: nameHolder,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      hintText: ("Type a message..."),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide.none,
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
                          // backgroundColor:
                          // MaterialStateProperty.all(Colors.green),
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
            ),
          ),
        ],
      ),
    );
  }
}
