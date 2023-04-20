// import 'package:path/path.dart' as Path;

import 'dart:convert';

import 'package:bucket_list_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});
  @override
  State<StatefulWidget> createState() => _todoState();
}

// ignore: camel_case_types
class _todoState extends State<Todolist> {
  Future<Map> getlistval() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? arr = pref.getString('Name');
    Map<String, dynamic> arr2 = json.decode(arr!);
    return arr2;
  }

  Future<String?> setListval() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Name', enarr);
    return '';
  }

  String name = '';
  late TextEditingController controller;
  var checked = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    checkforval();
    enarr = '';
  }

  Future checkforval() async {
    Map arr2 = await getlistval();
    setState(() {
      namesarr = arr2;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Map<dynamic, dynamic> namesarr = {};
  late String enarr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                              enarr = json.encode(namesarr);
                              // print(namesarr);
                              print(enarr);
                              setListval();
                            });
                          },
                        )));
              },
              itemCount: namesarr.length,
            )),
            const SizedBox(height: 16),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[900])),
              onPressed: () {
                setState(() {
                  deleteval();
                });
              },
              child: Text(
                'Delete Checked',
                softWrap: true,
                style: TextStyle(color: Colors.black),
              ),
            ),
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
          icon: const Icon(Icons.add_circle)),
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

  void deleteval() {
    namesarr.removeWhere((key, value) => value == true);
    setListval();
  }
}
