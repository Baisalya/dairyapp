import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Controller/AuthController.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildSettingsList(),
      bottomNavigationBar: _buildAppVersion(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('App Settings'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Implement back button functionality
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Implement notification button functionality here
          },
        ),
      ],
    );
  }

  Widget _buildSettingsList() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: [
        _buildSectionHeader('General', 'Edit profile, change password'),
        _buildGeneralSection(),
        _buildSectionHeader('Permissions', 'App permissions'),
        _buildAppPermissionsSection(),
        _buildSectionHeader('Legal', 'Terms and support'),
        _buildTermsAndSupportSection(),
        _buildLogoutButton(),
      ],
    );
  }

  Widget _buildSectionHeader(String headingText, String descriptionText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Text(
          headingText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 8.0),
        Text(descriptionText, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 16.0),
        Divider(thickness: 1.0, height: 1.0, color: Colors.grey),
      ],
    );
  }

  Widget _buildGeneralSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListTile('Edit Profile', Icons.person, () {
          // Implement edit profile functionality here
          Get.toNamed('/editProfile');

        }),
        _buildListTile('Change Password', Icons.lock, () {
          // Implement change password functionality here
          Get.toNamed('/changePassword');
        }),
        SizedBox(height: 16.0),
        Divider(thickness: 1.0, height: 1.0, color: Colors.grey),
      ],
    );
  }

  Widget _buildAppPermissionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListTileWithSwitch('Notifications', true, (value) {
          // Implement notification switch functionality here
        }),
        _buildListTile('Other Permissions ', Icons.settings, () {
          // Implement other permissions functionality here
        }),
        SizedBox(height: 16.0),
        Divider(thickness: 1.0, height: 1.0, color: Colors.grey),
      ],
    );
  }

  Widget _buildTermsAndSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListTile('Terms and Conditions ', Icons.description, () {
          // Implement terms and conditions functionality here
          Get.toNamed('/termscnd');
        }),
        _buildListTile('Privacy Policy ', Icons.privacy_tip, () {
          // Implement privacy policy functionality here
          Get.toNamed('/pp');
        }),
        _buildListTile('Support ', Icons.help, () {
          // Implement support functionality here
          //Get.toNamed('/privacy policy');

          Get.toNamed('/help&support');
        }),
        SizedBox(height: 16.0),
        Divider(thickness: 1.0, height: 1.0, color: Colors.grey),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return ElevatedButton.icon(
      onPressed: () async {
        // Call signOut method from AuthController
        await AuthController().signOut();

        // Navigate to the login screen
        Get.offNamed('/login');
      },
      icon: Icon(Icons.logout, color: Colors.red),
      label: Text('Logout', style: TextStyle(color: Colors.red)),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }


  Widget _buildListTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right), // Forward arrow icon
      onTap: onTap,
    );
  }

  Widget _buildListTileWithSwitch(String title, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildAppVersion() {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'App Version 2.0.0',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
