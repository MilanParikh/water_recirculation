import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:water_recirculation/model/schedule.dart';

final firebaseReference = FirebaseDatabase.instance.reference();

class AddTimePage extends StatefulWidget {
  AddTimePage({Key key}) : super(key: key);

  @override
  _AddTimePageState createState() => new _AddTimePageState();
}

class _AddTimePageState extends State<AddTimePage> {

  String start = "Start Time";
  String end = "End Time";
  TimeOfDay startTime;
  TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add Time"),
      ),
      body: new Column(children: <Widget>[
        new Divider(height: 16.0,),
        new Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new RaisedButton(
                  onPressed: (() => _showTimePicker(context, 0)),
                  child: new Text(start)),
            ),
            new Padding(padding: new EdgeInsets.all(8.0),
                child: new RaisedButton(
                  onPressed: (() => _showTimePicker(context, 1)),
                  child: new Text(end),))
          ],),
        new Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: onSubmit,
                child: new Text("Submit"),),)
          ],)
      ],),
    );
  }

  Future _showTimePicker(BuildContext context, int type) async {
    TimeOfDay timeOfDay =
    await showTimePicker(context: context, initialTime: new TimeOfDay.now());

    setState(() {
      if (timeOfDay != null) {
        switch (type) {
          case 0:
            start =
                timeOfDay.hour.toString() + ":" + timeOfDay.minute.toString();
            startTime = timeOfDay;
            break;
          case 1:
            end = timeOfDay.hour.toString() + ":" + timeOfDay.minute.toString();
            endTime = timeOfDay;
            break;
        }
      }
    });
  }

  onSubmit() {
    Schedule schedule = new Schedule(startTime.hour, startTime.minute, endTime.hour, endTime.minute);
    firebaseReference.child("schedule").push().set(schedule.scheduleToJson());
  }

}



