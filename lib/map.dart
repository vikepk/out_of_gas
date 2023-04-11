import 'package:flutter/material.dart';
import 'package:out_of_gas/main.dart';
import 'package:out_of_gas/map_utils.dart';

int petrol = 2;
late String name = "Niru";
late String location = "Junction,Tirunelveli";

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: Text("Info"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Divider(
              color: Colors.white,
              height: 60.0,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$name',
              style: TextStyle(
                color: Colors.purple[600],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'LOCATION',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$location',
              style: TextStyle(
                color: Colors.purple[600],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Petrol Needed',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$petrol Litre',
              style: TextStyle(
                color: Colors.purple[600],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 80),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  Maptutils.openmap(8.7139, 77.7567);
                },
                child: Text(
                  "Open Map",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
