import "package:flutter/material.dart";
import 'package:bucket_list_app/screens/Homepage/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Bucket List',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 9, 9, 9)),
      home: Homepage(),
    );
  }
}
