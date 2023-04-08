// import 'package:path/path.dart' as Path;

import 'package:bucket_list_app/colors.dart';
import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _todoState();
}

class _todoState extends State<Todolist> {
  String name = '';
  late TextEditingController controller;
  var checked = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
      Row(
        children: [
          // checkbox_builder(name)
          Expanded(
              child: CheckboxListTile(
            value: checked,
            title: Text(name),
            secondary: const Icon(Icons.add),
            onChanged: (bool? value) {
              setState(() {
                checked = value!;
              });
            },
          ))
        ],
      ),
      const SizedBox(height: 16),
      ElevatedButton(
          onPressed: () async {
            final name = await openpopup(context);

            if (name == null || name.isEmpty) return;

            setState(() => this.name = name);
          },
          child: Text('feabheab')),
    ])));
  }

  Future<String?> openpopup(BuildContext context) => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('this popup'),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'enter something'),
              controller: controller,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    submit(context);
                  },
                  child: Text('Submit'))
            ],
          ));

  void submit(BuildContext context) {
    Navigator.of(context).pop(controller.text);
  }
}

// Widget checkbox_builder(String label) {
//   return StatefulBuilder(
//       builder: (ctx, setState) => Container(
//               child: CheckboxListTile(
//             value: checked,
//             title: Text(label),
//             secondary: const Icon(Icons.add),
//             onChanged: (bool? value) {
//               setState(() {
//                 checked = value!;
//               });
//             },
//           )));
// }
