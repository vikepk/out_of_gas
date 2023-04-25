import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'package:out_of_gas/services/current_location.dart';

import 'package:out_of_gas/services/map_utils.dart';
import 'package:out_of_gas/services/map.dart';
import 'package:out_of_gas/pages/first_page.dart';
import 'package:out_of_gas/pages/helper_page.dart';
import 'package:out_of_gas/pages/need_gas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:out_of_gas/pages/test.dart';

//import 'package:out_of_gas/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/first',
    routes: {
      '/map': (context) => Map(),
      '/helper': (context) => Helper(),
      '/first': (context) => HomePage(),
      '/location': (context) => Currentlocation(),
      '/need_gas': (context) => Need_Gas(),
      '/read_data': (context) => ReadData(),
    },
  ));
}

/*void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      routes: {
        '/map': (context) => Map(),
        '/helper': (context) => Helper(),
        '/first': (context) => HomePage(),
        '/location': (context) => Currentlocation(),
        '/need_gas': (context) => Need_Gas(),
      },
    ));*/
