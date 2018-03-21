import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/schedule_page.dart';
import 'ui/add_time_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Water Recirculation System',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Water Recirculation System Status'),
      routes: <String, WidgetBuilder> {
        '/home_page': (BuildContext context) => new MyHomePage(title: 'Water Recirculation System Status'),
        '/schedule_page': (BuildContext context) => new SchedulePage(),
        '/add_time_page': (BuildContext context) => new AddTimePage(),

      },
    );
  }
}