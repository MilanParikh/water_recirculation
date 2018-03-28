import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';

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
      body: new Column(
        children: <Widget>[
          new Flexible(
              child: new FirebaseAnimatedList(
                  query: firebaseReference.child("schedule"),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return new ListTile(
                      leading: new Icon(Icons.access_time),
                      title: new Text(getTime(snapshot)),
                      subtitle: null,
                      trailing: null,
                      onLongPress: () {deleteConfirmation(snapshot);},
                    );
                  }))
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {Navigator.of(context).pushNamed('/add_time_page');},
          child: new Icon(Icons.add),),
    );
  }

  Future<Null> deleteConfirmation(DataSnapshot snapshot) async {
    return showDialog(context: context,
        child: new AlertDialog(
            title: new Text("Do you want to delete this time slot?"),
            actions: <Widget>[
              new FlatButton(onPressed: () {
                firebaseReference.child('schedule').child(
                    snapshot.key.toString()).remove();
                Navigator.pop(context);
              }, child: new Text("Delete")),
              new FlatButton(onPressed: () {
                Navigator.pop(context);
              }, child: new Text("Cancel"))
            ],));
  }

}



String getTime(DataSnapshot snapshot) {
  String startHour = snapshot.value["startHour"].toString();
  String startMinute = snapshot.value["startMinute"].toString().padLeft(2,'0');
  String endHour = snapshot.value["endHour"].toString();
  String endMinute = snapshot.value["endMinute"].toString().padLeft(2, '0');
  String startTime = startHour + ":" + startMinute;
  String endTime = endHour + ":" + endMinute;
  return startTime + " - " + endTime;
}