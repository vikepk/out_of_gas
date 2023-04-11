import 'package:flutter/material.dart';

import 'package:out_of_gas/splash_screen.dart';

import 'package:out_of_gas/services/current_location.dart';

import 'package:out_of_gas/services/map_utils.dart';
import 'package:out_of_gas/services/map.dart';
import 'package:out_of_gas/pages/first_page.dart';
import 'package:out_of_gas/pages/helper_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      routes: {
        '/map': (context) => Map(),
        '/helper': (context) => Helper(),
        '/first': (context) => HomePage(),
      },
    ));
