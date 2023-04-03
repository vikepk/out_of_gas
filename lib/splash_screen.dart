// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:out_of_gas/current_location.dart';

class splash extends StatefulWidget {
  const splash({super.key});
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const Currentlocation()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Splash Screen",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
