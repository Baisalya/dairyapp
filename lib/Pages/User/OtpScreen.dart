import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';
import '../../Utility/theme.dart'; // Assuming you are using GetX for navigation
import 'dart:async';


class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  late final String verificationId;

  OtpScreen({required this.phoneNumber, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _smsCodeController = TextEditingController();
  late Timer _timer;
  int _start = 30; // Countdown start time in seconds
  bool _isButtonDisabled = true; // Resend button state

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 30; // Reset timer
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
    String smsCode = _smsCodeController.text.trim();
    if (smsCode.isNotEmpty) {
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
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter the OTP sent to ${widget.phoneNumber}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _smsCodeController,
              decoration: InputDecoration(
                labelText: 'Verification Code',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signInWithSmsCode,
              style: AppTheme.elevatedButtonStyle,
              child: Text(
                'Verify Code',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Resend code in $_start seconds',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isButtonDisabled ? null : _resendCode,
              style: _isButtonDisabled
                  ? ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey))
                  : AppTheme.elevatedButtonStyle,
              child: Text(
                'Resend Code',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



