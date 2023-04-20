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
      body: Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/c.JPG"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              TweenAnimationBuilder(
                child: SizedBox(
                    child: Text(
                      'Bucket List',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 0, 97, 253)),
                    ),
                    height: 140),
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 3),
                builder: (BuildContext context, double _val, Widget? child) {
                  return Opacity(
                    opacity: _val,
                    child: child,
                  );
                },
              ),
              Flexible(child: Todolist())
            ]),
      ),
    );
  }
}
