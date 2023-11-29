import 'package:flutter/material.dart';
import 'package:lifwy/homescreen.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.pink),
      home: splash(),
      routes: <String,WidgetBuilder>{
        '/homeScreen':(BuildContext context)=>homescreen(),
      },
    );
  }
}

