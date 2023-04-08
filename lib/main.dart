import "package:flutter/material.dart";
import 'package:bucket_list_app/screens/Homepage/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bucket List',
      home: Homepage(),
    );
  }
}
