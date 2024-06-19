import 'dart:io';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class SupportViewModel extends ChangeNotifier {

  Future<void> launchWhatsApp(BuildContext context) async{
    var contact = "+918249166181";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('WhatsApp is not installed on your device.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  Future<void> launchWhatsApps(BuildContext context) async {
    const whatsappNumber = '918249166181'; // Ensure the number is correct
    const message = 'Hello Support';

    // Construct the WhatsApp URL
    final whatsappUri = Uri.parse('https://wa.me/$whatsappNumber/?text=${Uri.encodeComponent(message)}');

    // Check if the WhatsApp app is installed and launch it
    if (await canLaunchUrl(whatsappUri)) {
      await launchWhatsApp(whatsappUri as BuildContext);
    } else {
      // Handle the case where WhatsApp is not installed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('WhatsApp is not installed on your device.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }




  void launchEmail(BuildContext context) async {
    const email = 'baishalya1999@gmail.com';
    var androidUrl = 'mailto:$email?subject=Support%20Request';
    var iosUrl = 'mailto:$email?subject=Support%20Request';
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while trying to open the email application. Please check if you have an email app configured on your device.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  void makePhoneCall(BuildContext context) async {
    const phoneNumber = '918249166181'; // Replace with your support phone number
    final phoneUrl = 'tel:$phoneNumber';

    try {
      if (Platform.isIOS) {
        await launch(phoneUrl);
      } else {
        await launch(phoneUrl);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while trying to make a phone call. Please check if you have a phone app configured on your device.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
