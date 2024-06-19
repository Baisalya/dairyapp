import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _image;
  String fullName = '';

/*  // Function to open the gallery and select an image
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to open the camera and take a photo
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }*/

  Future<void> _pickImageFromCameraOrGallery(bool isCamera) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  String selectedGovtIDType = 'Aadhar Card';
  List<String> govtIDTypes = [
    'Aadhar Card',
    'Driving License',
    'Passport',
    'Voter ID',
  ];
  String selectedSex = 'Male'; // Default value for the selected sex/gender
  List<String> sexOptions = [
    'Male',
    'Female',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildProfilePicture(),
              SizedBox(height: 32),
              buildFullNameField(),
              SizedBox(height: 16),
              buildSexDropdown(),
              SizedBox(height: 16),
              buildLocationField(),
              SizedBox(height: 16),
              buildEmailField(),
              SizedBox(height: 16),
              buildPhoneNumberField(),
              SizedBox(height: 16),
              buildGovtIDTypeDropdown(),
              SizedBox(height: 16),
              buildGovtIDNumberField(),
              SizedBox(height: 32),
              buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
  //
  Widget buildProfilePicture() {
    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 144, // Set a fixed width for the container
            height: 144, // Set a fixed height for the container
            child: ClipOval(
              child: _image != null
                  ? Image.file(
                _image!,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                'assets/default_profile_picture.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text('Take a Photo'),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImageFromCameraOrGallery(true); // Open camera
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.image),
                          title: Text('Choose from Gallery'),
                          onTap: () {
                            Navigator.pop(context);
                            _pickImageFromCameraOrGallery(
                                false); // Open gallery
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
    );
  }
  //
  Widget buildFullNameField() {
    return TextFormField(
      //controller: _fullNameController, // Link the controller to the TextFormField
      onChanged: (value) {
        setState(() {
          fullName = value;
        });
      },
      decoration: InputDecoration(
        labelText: 'Full Name',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
  //
  Widget buildSexDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedSex,
      onChanged: (newValue) {
        setState(() {
          selectedSex = newValue!;
        });
      },
      items: sexOptions.map((sex) {
        return DropdownMenuItem<String>(
          value: sex,
          child: Text(sex),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Sex/Gender',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
  //
  Widget buildLocationField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Location',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.location_on),
      ),
      // Add logic to update location
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      // Add logic to update email
    );
  }

  Widget buildPhoneNumberField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone No',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.phone),
      ),
      // Add logic to update phone number
    );
  }

  Widget buildGovtIDTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedGovtIDType,
      onChanged: (newValue) {
        setState(() {
          selectedGovtIDType = newValue!;
        });
      },
      items: govtIDTypes.map((type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Government ID Type',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.card_membership),
      ),
    );
  }

  Widget buildGovtIDNumberField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Government ID No',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.assignment_ind),
      ),
      // Add logic to update government ID number
    );
  }

  Widget buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Add logic to submit the updated profile data
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          'Save Changes',
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}