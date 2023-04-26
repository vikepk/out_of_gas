import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'package:out_of_gas/services/current_location.dart';

import 'package:out_of_gas/services/map_utils.dart';
import 'package:out_of_gas/pages/map.dart';
import 'package:out_of_gas/pages/first_page.dart';

import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Need_Gas extends StatefulWidget {
  const Need_Gas({super.key});

  @override
  State<Need_Gas> createState() => _Need_GasState();
}

bool _validate = false;
var name = TextEditingController();
var number = TextEditingController();
var type = TextEditingController();
final type1 = "Petrol";
var petrol_needed = TextEditingController();
var location = TextEditingController();
const List<String> list = <String>['Petrol', 'Diesel'];
String dropdownValue = list.first;
String locationmessage = "Your location";
late String lat;

late String long;

class _Need_GasState extends State<Need_Gas> {
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Details"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.blue[900],
                        ),
                        //labelText: "Name",
                        errorText: _validate ? 'Name is Required' : null,
                        hintText: "Name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.blue[900],
                        ),
                        // labelText: "Ph.Number",
                        errorText:
                            _validate ? 'Contact Number is required' : null,
                        hintText: "Contact number",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "       Fuel Type :",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.blue[900],
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text("Type of Fuel"),
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: petrol_needed,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.water_drop_outlined,
                          color: Colors.blue[900],
                        ),
                        // labelText: "Blood Group",
                        errorText:
                            _validate ? 'Fuel Quantity is Required' : null,
                        hintText: "Fuel Needed",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print(value);

                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: location,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.blue[900],
                        ),
                        // labelText: "Address",
                        errorText: _validate ? 'Location is required' : null,
                        hintText: "Location",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(locationmessage as String),
            ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: CircularProgressIndicator(),
                        //duration(seconds: 5),
                        // duration: Duration(seconds: 5),
                      );
                    },
                  );
                  await getuserlocation().then((value) {
                    lat = '${value.latitude}';
                    long = '${value.longitude}';
                    setState(() {
                      locationmessage = '$lat, $long' as String;
                    });
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("GPS Location")),
            GestureDetector(
              onTap: () {
                setState(() {
                  name.text.isEmpty ? _validate = true : _validate = false;
                  number.text.isEmpty ? _validate = true : _validate = false;
                  petrol_needed.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                  location.text.isEmpty ? _validate = true : _validate = false;
                  //hosp_name.text.isEmpty ? _validate = true : _validate = false;
                });
                if (name.text != "" &&
                    number.text != "" &&
                    petrol_needed.text != "" &&
                    location.text != "") {
                  var users = {
                    'name': name.text,
                    'number': number.text,
                    'petrol_type': type1,
                    'petrol_quantity': petrol_needed.text,
                    'lat&long': locationmessage,
                    'location': location.text,
                  };
                  dbRef.push().set(users);
                  print(users);
                  Navigator.pushNamed(context, '/wait');
                  name.clear();
                  number.clear();
                  // type1.clear();
                  petrol_needed.clear();
                  locationmessage = "Your location";
                  location.clear();
                }
              },
              child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/img1.png"),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Text(
                      "Proceed",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
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
