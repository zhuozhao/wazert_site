import 'package:flutter/material.dart';

///车辆里程查询
class CarMilePage extends StatefulWidget {
  @override
  _CarMilePageState createState() => _CarMilePageState();
}

class _CarMilePageState extends State<CarMilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("里程查询"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[],
      ),
    );
  }
}
