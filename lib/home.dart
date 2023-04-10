import 'package:flutter/material.dart';
import 'package:out_of_gas/main.dart';
import 'package:out_of_gas/map_utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Maptutils.openmap(8.7139, 77.7567);
          },
          child: Text(
            "Open Map",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    )));
  }
}
