import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AppTheme {
  // Primary color of the app
  static const Color primaryColor = Colors.blue; // Example color

  // Secondary color of the app
  static const Color secondaryColor = Colors.blueGrey; // Example color

  // Text color for normal text
  static const Color textColor = Color(0xFF000000); // Example color

  // Heading text color
  static const Color headingColor = Color(0xFF1A237E); // Example color
// Title text color
  static const Color titleColor = Colors.white; // Example color
  // Bold text color
  static const Color boldTextColor = Color(0xFF212121); // Example color

  // Subtitle text color
  static const Color subtitleColor = Color(0xFF757575); // Example color

  // Background color
  static const Color backgroundColor = Color(0xFFF5F5F5); // Example color

  // Error color
  static const Color errorColor = Color(0xFFB00020); // Example color

  // App bar color
  static const Color appBarColor = primaryColor;

  // Button color
  static const Color buttonColor = primaryColor;

  // Card color
  static const Color cardColor = Colors.white;

  // Shadow color
  static  Color shadowColor = Colors.black.withOpacity(0.1);

  // Divider color
  static const Color dividerColor = Colors.grey;

  // Text styles
  static const TextStyle headingTextStyle = TextStyle(
    color: headingColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  // Text styles
  static const TextStyle TitleTextStyle = TextStyle(
    color: titleColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle boldTextStyle = TextStyle(
    color: boldTextColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    color: subtitleColor,
    fontSize: 16,
  );

  static const TextStyle normalTextStyle = TextStyle(
    color: textColor,
    fontSize: 14,
  );

  // Button text style
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 6,
    fontWeight: FontWeight.bold,
  );
  // Button style
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: buttonColor, // Background color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0), // Large value to make the button round
    ),
    minimumSize: Size(60, 60), // Ensuring the button has a circular shape
  );
}

