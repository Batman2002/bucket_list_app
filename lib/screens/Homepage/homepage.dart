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
      body:
          Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/c.JPG"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(height: 30),
              SizedBox(height: 160,),
              Flexible(child: Todolist())
          ]
        ),
      ),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    toolbarHeight: 200,
    elevation: 0,
    backgroundColor: grey,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
  );
}
