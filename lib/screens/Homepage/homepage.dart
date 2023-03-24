import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _eventcreator();
}

// class create_event extends StatefulWidget{
//   @override
//   Widget build(BuildContext context){
//     return Column(

//     );
//   }

//   @override
//   State<create_event> createState()=> _eventcreator(); {
//     Widget build(BuildContext context){
//       return Row(
//         children: [],
//       );
//     };
//   }
// }

class _eventcreator extends State<Homepage> {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(239, 34, 41, 251),
          onPressed: () {
            setState(() {
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {
                      _createevent(true);
                    },
                  )
                ],
              );
            });
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}

_createevent(value) {
  return const Text('Hello');
}
