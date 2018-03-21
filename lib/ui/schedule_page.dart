import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

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
                      onLongPress: () {
                        firebaseReference.child('schedule').child(
                            snapshot.key.toString()).remove();
                      },
                    );
                  }))
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {Navigator.of(context).pushNamed('/add_time_page');},
          child: new Icon(Icons.add),),
    );
  }
}

String getTime(DataSnapshot snapshot) {
  String startHour = snapshot.value["startHour"].toString();
  String startMinute = snapshot.value["startMinute"].toString();
  String endHour = snapshot.value["endHour"].toString();
  String endMinute = snapshot.value["endMinute"].toString();
  String startTime = startHour + ":" + startMinute;
  String endTime = endHour + ":" + endMinute;
  return startTime + " - " + endTime;
}