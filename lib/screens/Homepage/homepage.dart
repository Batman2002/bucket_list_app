import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        appBar: AppBar(
          title: const Text('Bucket List!!!!!!'),
          backgroundColor: const Color.fromARGB(232, 117, 10, 239),
          centerTitle: true,
        ),
        // bottomNavigationBar: Row(
        // children: [
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(239, 34, 41, 251),
          onPressed: () {},
          child: const Icon(Icons.add),
          // ],
        ),
      );
    });
  }
}
