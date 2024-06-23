import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const TextStyle headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle subHeadingStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle contentStyle = TextStyle(
  fontSize: 16,
);

class PrivacyPolicyScreen extends StatelessWidget {
  final String appName = "Pure Dairy";
  final String lastUpdated = DateFormat.yMMMMd().format(DateTime.now());
  final String contactEmail = "baishalya1999@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy for $appName',
                style: headingStyle,
              ),
              SizedBox(height: 16),
              Text(
                'Last Updated: $lastUpdated',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              buildIntroductionSection(),
              buildInformationSection(),
              buildAdditionalSection(),
              SizedBox(height: 16),
              CustomPrivacyPolicySection(
                title: '8. Contact Us',
                content:
                'If you have any questions, concerns, or requests regarding this Privacy Policy, please contact us at $contactEmail.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIntroductionSection() {
    return CustomPrivacyPolicySection(
      title: '1. Introduction',
      content:
      'Welcome to $appName. This Privacy Policy outlines our practices regarding the collection, use, and disclosure of personal information when you use our real-time app.',
    );
  }

  Widget buildInformationSection() {
    return CustomPrivacyPolicySection(
      title: '2. Information We Collect',
      content: '''
        - **Personal Information:** We may collect personal information such as names, email addresses, and phone numbers when users voluntarily provide them.
        - **Location Data:** Our app may collect real-time location data to provide location-based services. Users can enable or disable location services at any time through their device settings.
        - **Device Information:** We may collect information about the devices used to access our app, including device models, operating systems, and unique identifiers.
        - **Usage Data:** We collect data about how users interact with our app, including the features they use and the content they view.
      ''',
    );
  }

  Widget buildAdditionalSection() {
    return CustomPrivacyPolicySection(
      title: '3. Additional Information',
      content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis accumsan, mauris vel tristique venenatis, dolor risus commodo dolor, et vestibulum lectus orci in erat.',
    );
  }
}

class CustomPrivacyPolicySection extends StatelessWidget {
  final String title;
  final String content;

  CustomPrivacyPolicySection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: subHeadingStyle,
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: contentStyle,
          ),
        ],
      ),
    );
  }
}
