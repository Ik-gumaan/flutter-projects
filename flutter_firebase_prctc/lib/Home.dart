import 'dart:io'; //using File
import 'dart:js';


import 'package:image_picker_web/image_picker_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream<QuerySnapshot> postStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String imagePath = "";
  late File image;

  pickImage() async {
    final ImagePicker picker =
        ImagePicker(); //initializing image picker (only for android and ios ,not for web)
    final image = await picker.getImage(source: ImageSource.gallery);
//  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = image!.path;
    });
  }

  submitPost() async {
    String title = titleController.text;
    String desc = descController.text;
    String imageName=Path.basename(imagePath);

//using firebase storage
    try {
      FirebaseFirestore db =
          FirebaseFirestore.instance; //instance of firebase firestore(database)
      firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      firebase_storage.Reference ref = storage.ref('/${imageName}');
// var url = base64.decode(imagePath);
// var url=Image.memory(base64Decode("d52036bd-675f-4f96-8f50-6c6d6303f2bd"));

      print("$imageName Path:${imagePath}");

      // print("Title:${title} \nDesc:${desc} \nImage:${url}");

      // File myFile= File(imagePath);
      //  await ref.putFile(myFile);

      // File myFile = File("D:\Docx\WhatsApp Images\messi.jpg");
      // await ref.putFile(myFile);
      // String downloadURL = await ref.getDownloadURL();

      // print("File uploaded ${downloadURL}"); //firebase srorage image url

//add used when we dont know the user id(generate id automatically)
//set used when we assign data to id
      await db.collection("posts").add({
        "title":title,
        "description":desc,
        "image":"https://firebasestorage.googleapis.com/v0/b/flutter-firebase-prctc.appspot.com/o/messi.jpg?alt=media&token=53d01ee0-a8b9-4110-8d0a-c5057ac93e38",
      });

      print("Post uploaded ");
      
      titleController.clear();
      descController.clear();

    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: titleController,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  hintText: 'Enter title'),
            ),
          ),

          SizedBox(height: 10),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: descController,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  hintText: 'Enter description'),
            ),
          ),

          SizedBox(height: 20),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 40,
            child: ElevatedButton(
              onPressed: pickImage,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_a_photo),
                SizedBox(width: 10),
                Text("Pick an Image"),
              ]),
            ),
          ),

          SizedBox(height: 20),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 40,
            child: ElevatedButton(
              onPressed: submitPost,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Icon(Icons.post_add),
                // SizedBox(width: 10),

                Text("Submit Post"),
              ]),
            ),
          ),

          SizedBox(height: 40),

          // SingleChildScrollView(
          // child:
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SafeArea(
                  child: StreamBuilder<QuerySnapshot>(
                stream: postStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return new ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =document.data() as Map<String, dynamic>;
                      String id=document.id;
                      data["id"]=id;

                      return Post(
                        data: data,
                      ); //passing firestore data as an argument
                    }).toList(),
                  );
                },

                //     child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Post(),
                //     Post(),
                //     Post(),
                //     Post(),
                //     Post(),
                //   ],
                // )

                // ),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('imagePath', imagePath));
  }
}

// ==================Firebase configuration=====================
// install flutter fire dependency in psubpec.yaml   firebase_core : "0.7.0"
// create project on firebase and app name should be app_id which is present in android/app/build.gradle
// then download google-services.json from firebase(provided on next screen of name) and add this in android/app folder
//now to use firebase on android, classpath 'com.google.gms:google-services:4.3.8' add this in app/build.gradle in dependencies
// now add apply plugin: 'com.google.gms.google-services' under apply plugin: 'com.android.application' in app/build.gradle file
// install flutter firebase auth dependency in psubpec.yaml   firebase_auth: "^0.20.1"
// install flutter firestore dependency in psubpec.yaml   cloud_firestore: "^0.16.0+1"
// initialize firebase services (code present in main)

// if sdk size error, then In app/build.gradle file,under dependencies add the line
// implementation 'com.android.support:multidex:1.0.3',
// and enable it within the defaultConfig:
// multiDexEnabled true

//if null safety error occur run this command: flutter run --no-sound-null-safety

class Post extends StatelessWidget {
  final Map data;
  Post({required this.data});



deletePost ()async{

try{
    FirebaseFirestore db =FirebaseFirestore.instance; //instance of firebase firestore(database)
    await db.collection("posts").doc(data["id"]).delete();

}

catch(e){
print("Error: $e");
}
}


void editPost()async{
   
// showDialog(context:context ,builder: (BuildContext context){
// return EditDialog(data:data);
// });

// try{
//     FirebaseFirestore db =FirebaseFirestore.instance; //instance of firebase firestore(database)
//     await db.collection("posts").doc(data["id"]).set({

//     });

// }

// catch(e){
// print("Error: $e");
// }


}



  @override
  Widget build(BuildContext context) {

    print("data of post: $data");

    return
        // MaterialApp(
        //     home: Scaffold(
        //         appBar: AppBar(
        //           title: Text("Home"),
        //         ),
        //         body:
        Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            data["image"],
            width: 300,
            height: 300,
          ),
          Text("Title : ${data["title"]}"),

          Text("Description : ${data["description"]}"),

SizedBox(height:30),

ElevatedButton(
              onPressed: editPost,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.edit),
                // SizedBox(width: 10),

                // Text("Edit Post"),
              ]),
            ),

SizedBox(height:10),
            ElevatedButton(
              onPressed: deletePost,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.delete),
                // SizedBox(width: 10),

                // Text("Delete Post"),
              ]),
            ),

          // GestureDetector(
          //   onTap: () {
          //     print(data["image"]);
          //   },
          //   child: Image.asset(
          //     "assets/images/cr7.jpg",
          //     width: 200,
          //     height: 200,
          //   ),
          // ),
          // Text("Title"),
        ],
      ),
      // ))
    );
  }
}




class EditDialog extends StatefulWidget {

final Map data;

EditDialog({required this.data});


  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();
  late String imagePath;

void initState(){
super.initState();

titleController.text=widget.data["title"];
descController.text=widget.data["description"];

}


updateImage() async{
    final ImagePicker picker =
        ImagePicker(); //initializing image picker (only for android and ios ,not for web)
    final image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      imagePath = image!.path;
    });

}


updatePost() async{

try {


String imageName=Path.basename(imagePath);
      FirebaseFirestore db =FirebaseFirestore.instance; //instance of firebase firestore(database)
      firebase_storage.FirebaseStorage storage =firebase_storage.FirebaseStorage.instance;
      firebase_storage.Reference ref = storage.ref('/${imageName}');

      // File myFile= File(imagePath);
      //  await ref.putFile(myFile);

      // File myFile = File("D:\Docx\WhatsApp Images\messi.jpg");
      // await ref.putFile(myFile);
      // String downloadURL = await ref.getDownloadURL();

Map<String, dynamic> newPost={
 "title":titleController.text,
 "description":descController.text,
//  "image":downloadURL,
"image":imagePath,
};

//In stateless widget we get data directly : data["id"]
//In statefull widget data is get through widget : widget.data["id"]
await db.collection("posts").doc(widget.data["id"]).set(newPost);

print("updated");
// Navigator.of(context).pop();

} catch (e) {
  print("Update Error: $e");
}

}



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [

Text("Edit Post"),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: titleController,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  hintText: 'Enter title'),
            ),
          ),

          SizedBox(height: 10),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: descController,
              maxLines: 1,
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                  hintText: 'Enter description'),
            ),
          ),

          SizedBox(height: 20),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 40,
            child: ElevatedButton(
              onPressed: updateImage,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_a_photo),
                SizedBox(width: 10),
                Text("Pick an Image"),
              ]),
            ),
          ),

          SizedBox(height: 20),

          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 40,
            child: ElevatedButton(
              onPressed: updatePost,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.update),
                // SizedBox(width: 10),

                // Text("Submit Post"),
              ]),
            ),
          ),




          ],
        ),
      ),

    );
  }
}