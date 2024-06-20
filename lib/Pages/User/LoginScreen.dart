import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';
import '../../Utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'OtpScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _phoneNumberController = TextEditingController();

  void _handleGoogleSignIn() async {
    User? user = await _authController.signInWithGoogle();
    if (user != null) {
      Get.offNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google sign-in failed')),
      );
    }
  }

  void _verifyPhoneNumber() async {
    String phoneNumber = _phoneNumberController.text.trim();
    if (phoneNumber.isNotEmpty) {
      await _authController.verifyPhoneNumber(
        phoneNumber,
            (verificationId) {
          Get.to(() => OtpScreen(phoneNumber: phoneNumber, verificationId: verificationId));
        },
            (credential) async {
          User? user = await _authController.signInWithPhoneNumber(
            credential.verificationId!,
            credential.smsCode!,
          );
          if (user != null) {
            Get.offNamed('/home');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Phone sign-in failed')),
            );
          }
        },
            (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone verification failed: ${error.message}')),
          );
        },
            (verificationId) {
          Get.to(() => OtpScreen(phoneNumber: phoneNumber, verificationId: verificationId));
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid phone number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF73AEF5), Color(0xFF61A4F1), Color(0xFF478DE0), Color(0xFF398AE5)],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/user/drinkmilk.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Log In to continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTextField(context, 'Mobile no:', controller: _phoneNumberController),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _verifyPhoneNumber,
                          style: AppTheme.elevatedButtonStyle,
                          child: Text(
                            'Send Code',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        OutlinedButton(
                          onPressed: _handleGoogleSignIn,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/google_logo.png', // Replace with your Google logo asset path
                                height: 24.0,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Sign up with Google',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText, {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: AppTheme.normalTextStyle.copyWith(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}



