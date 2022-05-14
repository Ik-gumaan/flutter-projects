import 'package:flutter/material.dart';

class ForTest extends StatefulWidget {
  @override
  _ForTestState createState() => _ForTestState();
}

class _ForTestState extends State<ForTest> {
  @override
  final ScrollController _controller = ScrollController();

// This is what you're looking for!
  void _scrollDown() {
    print(
      _controller.position.maxScrollExtent,
);
    _controller.jumpTo(
      _controller.position.maxScrollExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: _scrollDown,
        child: Icon(Icons.arrow_downward),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: 21,
        itemBuilder: (context, i) => ListTile(title: Text('Item $i')),
      ),
    );
  }
}
