import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Currentlocation extends StatefulWidget {
  const Currentlocation({super.key});

  @override
  State<Currentlocation> createState() => CurrentlocationState();
}

class CurrentlocationState extends State<Currentlocation> {
  String locationmessage = "this is a location message";

  late String lat;

  late String long;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Location"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(locationmessage),
              ElevatedButton(
                  onPressed: () {
                    getuserlocation().then((value) {
                      lat = '${value.latitude}';
                      long = '${value.longitude}';
                      setState(() {
                        locationmessage = '$lat and $long';
                      });
                    });
                  },
                  child: const Text("location"))
            ],
          ),
        ),
      ),
    );
  }

  Future<Position> getuserlocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location service is disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permission is disabled");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location Permission is disabled forever , we cannot request permission");
    }

    return await Geolocator.getCurrentPosition();
  }
}
