import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePages extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePages> {
  File? _image;

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select an option',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _imageFromCamera();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera_alt),
                    tooltip: 'Take a photo',
                  ),
                  IconButton(
                    onPressed: () {
                      _imageFromGallery();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.image),
                    tooltip: 'Choose from gallery',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _imageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<void> _imageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : AssetImage('assets/placeholder_profile.png') as ImageProvider,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Name: John Doe'),
            Text('Email: john.doe@example.com'),
            Text('Phone: 123-456-7890'),
            // Add more profile fields as needed
          ],
        ),
      ),
    );
  }
}
