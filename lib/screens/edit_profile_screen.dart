import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  File? _backgroundImage;

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickProfileImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickBackgroundImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _backgroundImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildBackgroundImage(),
                _buildProfileImage(),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _pickProfileImage(ImageSource.gallery),
              child: Text('Change Profile Photo'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _pickBackgroundImage(ImageSource.gallery),
              child: Text('Change Background Image'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 50.0,
      // backgroundImage: _profileImage != null
      //     ? FileImage(_profileImage!)
      //     : AssetImage('assets/images/default_profile.jpg'),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: _backgroundImage != null
            ? DecorationImage(
                image: FileImage(_backgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
        color: Colors.grey[300],
      ),
    );
  }
}
