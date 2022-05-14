import 'package:flutter/material.dart';
// import 'package:auto_size_text_field/auto_size_text_field.dart';

class TxtStatus extends StatefulWidget {
  @override
  _TxtStatusState createState() => _TxtStatusState();
}

class _TxtStatusState extends State<TxtStatus> {
  TextEditingController textStatusController = TextEditingController();

  updateTextStatus() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
// theme:ThemeData(
//   inputDecorationTheme: InputDecorationTheme(
//   hintStyle: TextStyle(
//      color: Colors.grey, // <-- Change this
//      fontSize: 36,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//      ),
//   ),
// ),

      home: Scaffold(
//       appBar: AppBar(
//       leading: ElevatedButton(onPressed: () {
//           Navigator.pop(context);
//         }, child: Icon(Icons.arrow_back),
// ),
//         backgroundColor: Colors.transparent,
//         // backgroundColor: Colors.green[500],

//       ),

        floatingActionButton: FloatingActionButton(
          onPressed: updateTextStatus,
          backgroundColor: Colors.green[500],
          child: Icon(
            Icons.send,
          ),
        ),
        body: Container(
          color: Colors.lightBlue,
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.transparent,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))),
              Expanded(
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.center,
                    // textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: Colors.white,
                    controller: textStatusController,
                    // maxLength: 700,
                    autofocus: true,
                    style: TextStyle(
                      color: Colors.white, // <-- Change this
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                    ),

                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 25, right: 25, top: 10, bottom: 50),
                        focusColor: Colors.white,
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Type Status here...'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
