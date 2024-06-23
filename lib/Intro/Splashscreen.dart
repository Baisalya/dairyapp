import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/AuthController.dart';import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = AuthController();

  @override
  void initState() {
    super.initState();
    // Check authentication status after a delay
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Delay for 3 seconds (simulate splash screen)
    await Future.delayed(Duration(seconds: 3));

    // Check if user is already authenticated
    User? currentUser = await _authController.getCurrentUser();
    if (currentUser != null) {
      // User is authenticated, navigate to home page
      Get.offNamed('/home'); // Assuming '/home' is your home page route
    } else {
      // User is not authenticated, navigate to login screen
      Get.offNamed('/login'); // Navigate to login page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/splash/milkbottle.png',
                  width: constraints.maxWidth,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/splash/Pure_Dairy.png',
                      width: constraints.maxWidth * 0.8, // Example of responsive design
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}




