import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate after 3 seconds
    Timer(Duration(seconds: 3), () {
      // Navigate to the new route
      Get.offNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/splash/milkbottle.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DairyApp',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


