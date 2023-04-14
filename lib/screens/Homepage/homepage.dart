import 'package:flutter/material.dart';
import 'package:bucket_list_app/colors.dart';
import '../todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: _appBar(),
      body: Todolist(),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: grey,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
  );
}
