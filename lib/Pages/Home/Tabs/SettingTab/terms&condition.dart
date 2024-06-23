import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('1. Acceptance of Terms'),
            SectionText(
              'By using the PUREDAIRY mobile application ("the App"), you agree to comply with and be bound by the following terms and conditions of use. If you do not agree to these terms, please do not use the App.',
            ),

            SectionTitle('2. Emergency Services Disclaimer'),
            SectionText(
              'The App is designed to assist users in accessing emergency services quickly. However, PassionateTech cannot guarantee the availability, response time, or effectiveness of emergency services. Users are encouraged to dial emergency services directly when in need.',
            ),

            SectionTitle('3. User Responsibilities'),
            SectionText(
              'a. You must provide accurate and up-to-date information when using the App.\n\n'
                  'b. You are solely responsible for any use of the App under your account.\n\n'
                  'c. You agree not to use the App for any unlawful purpose or in any way that may cause harm to others.',
            ),

            SectionTitle('4. Privacy and Data Security'),
            SectionText(
              'a. PassionateTech takes user privacy seriously. Please refer to our Privacy Policy for details on how we collect, use, and protect your personal information.\n\n'
                  'b. You acknowledge and agree that the App may collect and transmit location data when in use.',
            ),

            SectionTitle('5. Limitation of Liability'),
            SectionText(
              'a. PassionateTech shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use the App.\n\n'
                  'b. PassionateTech is not responsible for any actions or omissions of emergency services or third-party providers.',
            ),

            SectionTitle('6. Termination'),
            SectionText(
              'PassionateTech reserves the right to terminate or suspend your access to the App at any time, with or without cause.',
            ),

            SectionTitle('7. Changes to Terms and Conditions'),
            SectionText(
              'PassionateTech reserves the right to update or modify these terms and conditions at any time. Users will be notified of such changes, and continued use of the App after such modifications constitutes acceptance of the new terms.',
            ),

            SectionTitle('8. Governing Law'),
            SectionText(
              'These terms and conditions are governed by and construed in accordance with the laws of Your Jurisdiction. Any disputes arising out of or in connection with the use of the App shall be subject to the exclusive jurisdiction of the courts in Your Jurisdiction.',
            ),

            Divider(),

            Text(
              'Contact Information:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'PassionateTech\n[Aul,kendrapara]\nbaishalya1999@gmail.com\n[+918249166181]',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),

            Text(
              'Last Updated: ${DateTime.now().toString()}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;

  SectionText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}



