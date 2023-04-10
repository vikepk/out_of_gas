import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'package:out_of_gas/current_location.dart';

import 'package:out_of_gas/map_utils.dart';
import 'package:out_of_gas/home.dart';

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
      body: Center(
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
                onPressed: () {},
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
                onPressed: () {},
                child: Text(
                  "Need Gas",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
