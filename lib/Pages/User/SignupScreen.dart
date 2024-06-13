import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utility/theme.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor, // Use primary color from the theme
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
                      fit: BoxFit.cover, // or BoxFit.contain, BoxFit.fill, etc. depending on your requirement
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
                                text: 'Welcome, ',
                                style: AppTheme.headingTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.boldTextColor,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: AppTheme.headingTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppTheme.subtitleColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: _buildTextField(context, 'First Name')),
                            SizedBox(width: 10),
                            Expanded(child: _buildTextField(context, 'Last Name')),
                          ],
                        ),
                        SizedBox(height: 10),
                        _buildTextField(context, 'Contact No.'),
                        SizedBox(height: 10),
                        _buildTextField(context, 'Email'),
                        SizedBox(height: 10),
                        _buildTextField(context, 'City'),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Handle sign up
                          },
                          style: AppTheme.elevatedButtonStyle,
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppTheme.buttonTextStyle.color, // Match the icon color to your text style color if needed
                            size: 32.0, // Adjust the size as needed
                          ),
                        ),

                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Handle sign in navigation
                            Get.offNamed('/login');
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already Have An Account? ',
                                  style: AppTheme.subtitleTextStyle.copyWith(
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign In',
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


  Widget _buildTextField(BuildContext context, String labelText) {
    return TextField(
      style: AppTheme.normalTextStyle, // Use normal text style from AppTheme
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


