import 'package:flutter/material.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as Path;


class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
//   late File image;

  pickImage() async {
    // final ImagePicker picker =
    // ImagePicker(); //initializing image picker (only for android and ios ,not for web)
    // final image = await picker.getImage(source: ImageSource.camera);
//  final XFile? image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      // imagePath = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Camera Screen"),
          backgroundColor: Colors.green[500],
        ),
        body: Container(
          child: Text("Camera will open here..."),
        ));
  }
}
