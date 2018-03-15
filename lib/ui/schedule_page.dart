import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final firebaseReference = FirebaseDatabase.instance.reference();

class SchedulePage extends StatefulWidget {
  SchedulePage({Key key}) : super(key: key);

  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Schedule"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            null
          ],
        ),
      ),
    );
  }
}