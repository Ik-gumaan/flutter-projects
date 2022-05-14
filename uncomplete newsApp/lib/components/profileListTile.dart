import 'package:flutter/material.dart';

class ProfileListTile extends StatefulWidget {
  @override
  _ProfileListTileState createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {

late Map data;

// ProfileListTile(data:data);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.male,
        color: Theme.of(context).colorScheme.primaryVariant,
      ),
      // tileColor: Colors.black87,
      title: Text("",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryVariant,
          )),
      subtitle: Text("Male",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryVariant,
          )),
    );
  }
}
