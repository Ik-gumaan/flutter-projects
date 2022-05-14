import 'package:flutter/material.dart';

import '../newsApiServices.dart';
import '../newsResponse.dart';

class Headlines extends StatefulWidget {
  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  var lst = ["ali", "aj", "asas", "saad", "sadasd"];

  var favIconColor = Colors.grey;

  var fav = false;

  addToFav(i) {
    // lst[i]
    setState(() {
      // fav=!fav;
      print("${i}");
    });
    // fav=false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              // height: 220,
              width: MediaQuery.of(context).size.width * 1,
              // color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 20,
                  //       child:Icon(Icons.logout),
                  //     ),
                  //                         SizedBox(width: 10),
                  //   ],
                  // ),

                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * .5,
                    height: 120,
                    child: Image.asset("assets/images/cr7.jpg"),
                  ),
                  // CircleAvatar(
                  //   radius: 60,
                  //   backgroundImage: AssetImage("assets/images/cr7.jpg"),
                  // ),
                  SizedBox(height: 10),
                  Text(
                    "Cristiano Ronaldo",
                    //     style: TextStyle(
                    //       // color: Colors.white,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.w500,
                    // )
                  ),
                ],
              ),
            ),
          ),
          // Divider(
          //             height: 1,
          //             thickness: 1,
          //             color: Theme.of(context).colorScheme.onSurface,
          //           ),
          // Expanded(
          // child:


// FutureBuilder<List<Article>>(future:NewsApiServices().fetchNewsArticle(),builder: (context,snapshot){
// if(snapshot.hasData){
  // return CircularProgressIndicator();
// }
// else{
          //  return 
           ListView.builder(
              itemCount:3, 
              // snapshot.data!.length,
              // prodName.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // ListTile(
                    //   leading: Container(
                    //     // color: Colors.white,
                    //     // width: MediaQuery.of(context).size.width * .5,
                    //     // height: 120,
                    //     child: Image.asset("assets/images/cr7.jpg"),
                    //   ),

                    //   // tileColor: Colors.black87,
                    //   title: Text("News Name",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         color: Theme.of(context).colorScheme.primaryVariant,
                    //       )),
                    //   subtitle: Text("News Description",
                    //       style: TextStyle(
                    //         color: Theme.of(context).colorScheme.primaryVariant,
                    //       )),
                    //       trailing: GestureDetector(
                    //         onTap: (){addToFav(index);},
                    //         child: Icon(Icons.favorite,color:favIconColor,
                    //         //  fav==true ? Colors.red : Colors.grey,
                    //          )),
                    // ),
                    ListTile(
                      // leading:

                      // tileColor: Colors.black87,
                      title: Text("name"
                        // "${snapshot.data![index].title}"
                        ,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primaryVariant,
                          )),
                      subtitle: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                addToFav(index);
                              },
                              child: Icon(
                                Icons.favorite, color: favIconColor,
                                //  fav==true ? Colors.red : Colors.grey,
                              )),
                        ],
                      ),
                      trailing: Container(
                        // color: Colors.white,
                        // width: MediaQuery.of(context).size.width * .5,
                        // height: 120,
                        child: Image.asset("assets/images/cr7.jpg"),
                      ),
                    ),
                    Divider(
                      // height: 5,
                      thickness: 1,
                      // color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                );
              }),
// }
// })


          // ),
        ],
      ),
    );
  }
}
