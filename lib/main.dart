import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'current_location.dart';

import 'package:out_of_gas/map_utils.dart';
import 'package:out_of_gas/home.dart';
import 'package:out_of_gas/pages/first_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
//out of gas respo pk sriram
