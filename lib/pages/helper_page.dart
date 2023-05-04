import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Location"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: ((context, snapshot, animation, index) {
                  var data = {
                    'name': snapshot.child('name').value.toString(),
                    'location': snapshot.child('location').value.toString(),
                    'petrol_type':
                        snapshot.child('petrol_type').value.toString(),
                    'petrol_quantity':
                        snapshot.child('petrol_quantity').value.toString(),
                    'lat&long': snapshot.child('lat&long').value.toString(),
                    'ph_num': snapshot.child('number').value.toString(),
                  };
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/map', arguments: data);
                    },
                    child: Card(
                      //child: Text(snapshot.child('location').value.toString()),
                      child: SizedBox(
                        width: 10,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  //(position + 1 ).toString(),
                                  "Location : " +
                                      snapshot
                                          .child('location')
                                          .value
                                          .toString(),
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Petrol needed: " +
                                      snapshot
                                          .child('petrol_quantity')
                                          .value
                                          .toString() +
                                      " L",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.arrow_circle_right_outlined),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ))
            ],
          ),
        ));
  }
}
