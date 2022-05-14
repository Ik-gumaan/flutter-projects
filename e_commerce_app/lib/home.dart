import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var accDetailsTitles = [
    "Name",
    "Email Adddress",
    "Phone",
    "User ID",
    "Date of Birth",
    "Gender"
  ];
  var accDetailsSubTitles = [
    "Cristiano Ronaldo",
    "cristiano_ronaldo07@gmail.com",
    "+92 300 0000000",
    "778687686787",
    "20/2/1897",
    "Male"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("E-Commerce App",
                style: TextStyle(
                  color: Colors.white,
                )),
            Icon(Icons.shopping_cart_rounded),
          ],
        )),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black87,
          child: ListView(
            children: [
              Container(
                height: 190,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/cr7.jpg"),
                      ),
                      Text("Cristiano Ronaldo",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              // GestureDetector(onTap: (){},  //by wraping with GestureDetector we can redirected it to other page
              // child:
              ListTile(
                // tileColor: Colors.black87,
                title: Text("Account Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),

              // ListView.builder(itemCount:accDetailsTitles.length,itemBuilder: (context,index){

              // return ListTile(
              //   leading: Icon(Icons.verified_user_outlined,color:Colors.white,),
              //   tileColor: Colors.black87,
              //   // title: Text(accDetailsTitles[index], style: TextStyle(color: Colors.white)),

              //   title: Text("Helo", style: TextStyle(color: Colors.white)),
              //   subtitle: Text("greetings",

              //   // subtitle: Text(accDetailsSubTitles[index],
              //       style: TextStyle(color: Colors.white)),
              // );

              // }),

              ListTile(
                leading: Icon(
                  Icons.verified_user_outlined,
                  color: Colors.white,
                ),
                // tileColor: Colors.black87,
                title: Text("Username", style: TextStyle(color: Colors.white)),
                subtitle: Text("CristianoRonaldo7",
                    style: TextStyle(color: Colors.white)),
              ),

              ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                // tileColor: Colors.black87,
                title: Text("Email Address",
                    style: TextStyle(color: Colors.white)),
                subtitle: Text("cristiano_ronaldo7@gmail.com",
                    style: TextStyle(color: Colors.white)),
              ),

              ListTile(
                leading: Icon(
                  Icons.phone_outlined,
                  color: Colors.white,
                ),
                // tileColor: Colors.black87,
                title:
                    Text("Phone Number", style: TextStyle(color: Colors.white)),
                subtitle: Text("+92 300 0000000",
                    style: TextStyle(color: Colors.white)),
              ),

              ListTile(
                leading: Icon(
                  Icons.perm_identity_outlined,
                  color: Colors.white,
                ),
                // tileColor: Colors.black87,
                title:
                    Text("Account ID", style: TextStyle(color: Colors.white)),
                subtitle:
                    Text("127826728282", style: TextStyle(color: Colors.white)),
              ),

              ListTile(
                leading: Icon(
                  Icons.perm_contact_calendar_outlined,
                  color: Colors.white,
                ),
                // tileColor: Colors.black87,
                title: Text("Date of Birth",
                    style: TextStyle(color: Colors.white)),
                subtitle:
                    Text("20/2/1987", style: TextStyle(color: Colors.white)),
              ),

              ListTile(
                leading: Icon(
                  Icons.male,
                  color: Colors.white,
                ),
                // tileColor: Colors.black87,
                title: Text("Gender", style: TextStyle(color: Colors.white)),
                subtitle: Text("Male", style: TextStyle(color: Colors.white)),
              ),
              // ),
            ],
          ),
        ),
      ),

      // appBar:DrawerAppBar(),
      body: HomeBody(),
    );
  }
}

// ----------------------HomeBody===================
class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var prodName = [
    "iphone X",
    "Mercedes",
    "Nike Shoes",
    "Ferrari",
    "Branded Shirt",
    "Macbook",
    "Adidas Shoes",
    "Women's Hand bag",
    "Rado Wrist Watch",
    "Oppo A5s",
    "Portugal Football Kit",
    "Gaming PC"
  ];
  var prodImg = [
    "iphonex.jpg",
    "mercedes.jpg",
    "nike.jpg",
    "ferrari.jpg",
    "shirt.jpg",
    "macbook.jpg",
    "adidas.jpg",
    "hand bag.jpg",
    "rado watch.jpg",
    "oppo.jpg",
    "kit.jpg",
    "gaming pc.jpg"
  ];

// var prodImg=["assets/images/iphonex.jpg","assets/images/mercedes.jpg","assets/images/nike.jpg","assets/images/ferrari.jpg","assets/images/shirt.jpg","assets/images/macbook.jpg","assets/images/adidas.jpg","assets/images/hand bag.jpg","assets/images/rado watch.jpg","assets/images/oppo.jpg","assets/images/kit.jpg","assets/images/gaming pc.jpg"];

  var added = false;

  addedToCart() {
    setState(() {
      added = !added;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: prodName.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: 2),
              width: MediaQuery.of(context).size.width * 0.98,
              child: ListTile(
                tileColor: Colors.black12,
                hoverColor: Colors.white,
                focusColor: Colors.white,
                selectedTileColor: Colors.white,
                title: Text(
                  prodName[index],
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                subtitle: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Review",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     )),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 10,
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Text("Price: 20\$",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                ),

                leading: CircleAvatar(
                  // radius: 40,
                  backgroundColor: Colors.white,

                  child: ClipOval(
                      child: Image.asset(
                    "assets/images/" + prodImg[index],
                    fit: BoxFit.fitHeight,
                    //  matchTextDirection: true,
                    height: MediaQuery.of(context).size.height * .10,
                  )),

// leading:Image.asset("assets/images/"+prodImg[index],width:50,height: 100 ,),
// leading:Container(
//   width: 100,
//   height:100,
//   color: Colors.white,
                ),

                // backgroundImage: AssetImage(
                //   "assets/images/" + prodImg[index],
                // ),
                // ),
                trailing: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 1,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: 
                      () {},
                      // addedToCart,
                      child:
                          // added
                          //     ?
                          //     Text(
                          //         "Added",
                          //         style: TextStyle(fontSize: 12,fontWeight: bold,)
                                  
                          //       )
                          //     :
                          Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 25,
                      ),
                      // Text("Add to cart",style: TextStyle(fontSize: 10),),
                    )),
              ),
            ),
          );
        });
  }
}

// -----------------------DrawerAppBar========================
