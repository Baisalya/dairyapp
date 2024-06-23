import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';
import '../../Utility/theme.dart'; // Assuming you are using GetX for navigation
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:sms_autofill/sms_autofill.dart';

import '../../Controller/AuthController.dart';
import '../../Utility/theme.dart'; // Assuming you are using GetX for navigation

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  late final String verificationId;

  OtpScreen({required this.phoneNumber, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with CodeAutoFill {
  final AuthController _authController = AuthController();
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  late Timer _timer;
  int _start = 120; // Countdown start time in seconds
  bool _isButtonDisabled = true; // Resend button state

  @override
  void initState() {
    super.initState();
    _startTimer();
    listenForCode();
  }

  @override
  void codeUpdated() {
    final code = this.code;
    if (code != null) {
      setState(() {
        for (int i = 0; i < code.length; i++) {
          _otpControllers[i].text = code[i];
        }
      });

      if (code.length == 6) {
        _signInWithSmsCode();
      }
    }
  }

  void _startTimer() {
    _start = 120; // Reset timer
    _isButtonDisabled = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isButtonDisabled = false; // Enable resend button
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  Future<void> _resendCode() async {
    await _authController.verifyPhoneNumber(
      widget.phoneNumber,
          (verificationId) {
        setState(() {
          widget.verificationId = verificationId; // Update the verificationId
          _startTimer(); // Restart the timer
        });
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
        setState(() {
          widget.verificationId = verificationId;
        });
      },
    );
  }

  Future<void> _signInWithSmsCode() async {
    String smsCode = _otpControllers.map((controller) => controller.text).join();
    if (smsCode.length == 6) {
      User? user = await _authController.signInWithPhoneNumber(widget.verificationId, smsCode);
      if (user != null) {
        Get.offNamed('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid SMS code')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the verification code sent to your phone')),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6DFF1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/otp_lock.jpeg', // Add your illustration asset here
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter your Verification code',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'We will send you an One Time Passcode via this ${widget.phoneNumber} ',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return _buildOtpBox(index);
                }),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signInWithSmsCode,
              style: AppTheme.elevatedButtonStyle,
              child: Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
            Text(
              'Resend code in $_start seconds',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _isButtonDisabled ? null : _resendCode,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(
                'Resend code',
                style: TextStyle(
                  fontSize: 16.0,
                  color: _isButtonDisabled ? Colors.grey : Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add your change email address functionality here
                Get.offNamed('/login');
              },
              child: Text(
                'Change the Phone No:',
                style: TextStyle(fontSize: 16.0, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          controller: _otpControllers[index],
          focusNode: _focusNodes[index],
          maxLength: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppTheme.textColor),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          onChanged: (value) {
            if (value.length == 1) {
              if (index < 5) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            }
            if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }
}







