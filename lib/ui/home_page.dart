import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final firebaseReference = FirebaseDatabase.instance.reference();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int temperature = 01;
  bool startButton = true;
  bool stopButton = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Expanded(
                child: new Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      temperature.toString(),
                      style: new TextStyle(fontSize: 30.0),
                    ),
                    new Text("°F", style: new TextStyle(fontSize: 25.0)),
                  ],)),
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new RaisedButton(
                          onPressed: startButton ? onStart : null,
                          child: new Text("Start System"))),
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new RaisedButton(
                          onPressed: stopButton ? onStop : null,
                          child: new Text("Stop System"))),
                ],
              ),),
          ],
        ),
      ),
    );
  }

  void onStart() {
    firebaseReference.child("status").set("on");
    firebaseReference.child("temperature").onValue.listen((Event event) {
      setState(() {
        temperature = event.snapshot.value;
      });
    });
    setState(() {
      startButton = false;
      stopButton = true;
    });
  }

  void onStop(){
    firebaseReference.child("status").set("off");
    setState(() {
      startButton = true;
      stopButton = false;
    });
  }


}