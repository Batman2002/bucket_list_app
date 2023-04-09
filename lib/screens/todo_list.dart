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

  List namesarr = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
      // Row(
      // children: [
      Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: namesarr[index]['value'],
            title: Text(namesarr[index]),
            onChanged: (bool? value) {
              setState(() {
                namesarr[index]['value'] = value!;
              });
            },
          );
        },
        itemCount: namesarr.length,
      )),
      // ],
      // ),
      const SizedBox(height: 16),
      ElevatedButton(
          onPressed: () async {
            final name = await openpopup(context);

            if (name == null || name.isEmpty) return;

            setState(() {
              namesarr.add(name);
              // namesarr['value'] = false;
            });
          },
          child: const Text('Add item')),
    ])
            // )
            ));
  }

  Future<String?> openpopup(BuildContext context) => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('this popup'),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'enter something'),
              controller: controller,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    submit(context);
                    controller.clear();
                  },
                  child: const Text('Submit'))
            ],
          ));

  void submit(BuildContext context) {
    Navigator.of(context).pop(controller.text);
  }

  Widget checkbox_builder(String label) {
    var checked = false;
    return StatefulBuilder(
        builder: (ctx, setState) => CheckboxListTile(
              value: checked,
              title: Text(label),
              onChanged: (bool? value) {
                setState(() {
                  checked = value!;
                });
              },
            ));
  }
}
