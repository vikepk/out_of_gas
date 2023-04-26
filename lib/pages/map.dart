import 'package:flutter/material.dart';

import 'package:out_of_gas/services/map_utils.dart';

int petrol = 2;
late String name = "Niru";
late String location = "Junction,Tirunelveli";
var data = {};

class Mapdata extends StatefulWidget {
  const Mapdata({super.key});

  @override
  State<Mapdata> createState() => _MapdataState();
}

class _MapdataState extends State<Mapdata> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

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
              data['name'],
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
              data['location'],
              style: TextStyle(
                color: Colors.purple[600],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              '${data['petrol_type']} Needed',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '${data['petrol_quantity']} Litre',
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
                  Maptutils.openmap(data['lat&long']);
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
