import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'package:out_of_gas/services/current_location.dart';

import 'package:out_of_gas/services/map_utils.dart';
import 'package:out_of_gas/pages/map.dart';
import 'package:out_of_gas/pages/first_page.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

const String location = "Junction";

class Helper extends StatefulWidget {
  const Helper({super.key});

  @override
  State<Helper> createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("users");

  List myList = [];
  var data;

  void initState() {
    super.initState();
    readData();
    //json();
  }

  bool isLoading = true;
  List<String> list = [];

  void readData() async {
    // Stream<DatabaseEvent> stream = dbRef.onValue;
    //  stream.listen((DatabaseEvent event) {
    //   print('Event Type: ${event.type}'); // DatabaseEventType.value;
    // print('Snapshot: ${event.snapshot.value}'); // DataSnapshot
    //});
    // print(stream);

    //final event = await dbRef.once();
    final event = await dbRef.orderByChild("name").once();

    //print(event.snapshot.value);
    //var data = jsonEncode(event.snapshot.value);
    //var data1 = jsonDecode(data);

    // print(data1['NTsT38NIpMAXLBNzrxM'].toString());
    Map users = event.snapshot.value as Map;

    print(users);

    //String names = users["name"] as String;
    print(users['-NTyB_pKQmTVc7vfQAwd']['name']);
    //data = users['0'];
    print(data);
    // String data = users.toString();
    // print(data);

    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    //   var url = "" + "data.json";
    //   // Do not remove “data.json”,keep it as it is
    //   try {
    //     final response = await http.get(Uri.parse(url));
    //     final extractedData = json.decode(response.body);
    //     print(extractedData);
    //     if (extractedData == null) {
    //       return;
    //     }

    //     extractedData.forEach((blogId, blogData) {
    //       list.add(blogData['name']);
    //     });

    //     setState(() {
    //       isLoading = false;
    //     });
    //   } catch (error) {
    //     throw error;
    // // }
  }

  // void json() {
  //   Autogenerated id = Autogenerated.fromJson(jsonDecode(data));
  //   //print(id.nTsT38NIpMAXLBNzrxM);
  // }

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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/map');
            },
            child: Card(
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
                          "Location :" + " $list['name]",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Petrol needed: 2 L",
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
        },
      ),
    );
  }
}
