// import 'package:path/path.dart' as Path;

import 'package:bucket_list_app/colors.dart';
import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});
  @override
  State<StatefulWidget> createState() => _todoState();
}

// ignore: camel_case_types
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

  Map<String, bool> namesarr = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.only(bottom: 5, top: 5),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: black)),
                    elevation: 16,
                    child: CheckboxListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      tileColor: const Color.fromARGB(255, 204, 212, 220),
                      value: namesarr[namesarr.keys.toList()[index]],
                      title: Text(namesarr.keys.toList()[index]),
                      onChanged: (bool? value) {
                        setState(() {
                          namesarr[namesarr.keys.toList()[index]] = value!;
                        });
                      },
                    )));
          },
          itemCount: namesarr.length,
        )),
        const SizedBox(height: 16),
      ]),
      floatingActionButton: IconButton(
          onPressed: () async {
            final name = await openpopup(context);

            if (name == null || name.isEmpty) return;

            setState(() {
              this.name = name;
              final ele = <String, bool>{this.name: false};
              namesarr.addEntries(ele.entries);
            });
          },
          icon: const Icon(Icons.add_box_rounded)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
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
