import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utility/theme.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
            ),
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: Image.asset(
                      'assets/user/drinkmilk.png',
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome Back, ',
                                style: AppTheme.headingTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.boldTextColor,
                                ),
                              ),
                              TextSpan(
                                text: 'Log In',
                                style: AppTheme.headingTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.subtitleColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildTextField(context, 'Email'),
                        SizedBox(height: 10),
                        _buildTextField(context, 'Password', isPassword: true),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Handle log in
                          },
                          style: AppTheme.elevatedButtonStyle,
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppTheme.buttonTextStyle.color,
                            size: 32.0,
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Handle sign up navigation
                           Get.offNamed('/signup');
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't Have An Account? ",
                                  style: AppTheme.subtitleTextStyle.copyWith(
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: AppTheme.headingTextStyle.copyWith(
                                    color: AppTheme.primaryColor,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: AppTheme.normalTextStyle,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppTheme.secondaryColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: AppTheme.backgroundColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 1, vertical: 15),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.secondaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.secondaryColor, width: 2.0),
        ),
      ),
    );
  }
}


