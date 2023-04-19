import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'package:out_of_gas/services/current_location.dart';

import 'package:out_of_gas/services/map_utils.dart';
import 'package:out_of_gas/services/map.dart';

final name1 = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Out of Gas"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 30)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/helper');
                    },
                    child: Text(
                      "Helper ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(fontSize: 25)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/need_gas');
                    },
                    child: Text(
                      "Need Gas",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextField(
                    controller: name1,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final name = name1.text;
                      createuser(name: name);
                    },
                    child: Text("Submit"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future createuser({required String name}) async {
  final docUser = FirebaseFirestore.instance.collection('user').doc('my-id');
  final json = {'Mobile Number': 78946562, 'Name': name};
  await docUser.set(json);
}
