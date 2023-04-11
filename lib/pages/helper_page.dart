import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'package:out_of_gas/current_location.dart';

import 'package:out_of_gas/map_utils.dart';
import 'package:out_of_gas/map.dart';
import 'package:out_of_gas/pages/first_page.dart';

const String a = "Anto";

class Helper extends StatefulWidget {
  const Helper({super.key});

  @override
  State<Helper> createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/map');
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  //(position + 1 ).toString(),
                  "Location : $a ",
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
