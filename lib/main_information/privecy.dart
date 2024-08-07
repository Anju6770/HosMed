import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _nameController = TextEditingController(text: 'John Doe');
  final _emailController = TextEditingController(text: 'john.doe@example.com');
  final _bioController = TextEditingController(text: 'This is my bio.');
  final _phoneController = TextEditingController(text: '123-456-7890');
  bool _isEditing = false;
  bool _notificationsEnabled = true;
  bool _twoFactorEnabled = false;
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : NetworkImage('https://via.placeholder.com/150'), // Placeholder image
                ),
              ),
            ),
            SizedBox(height: 16.0),
            _buildProfileField('Name', _nameController),
            _buildProfileField('Email', _emailController),
            _buildProfileField('Bio', _bioController),
            _buildProfileField('Phone', _phoneController),
            SizedBox(height: 16.0),
            _buildSwitch('Email Notifications', _notificationsEnabled, (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            }),
            _buildSwitch('Two-Factor Authentication', _twoFactorEnabled, (value) {
              setState(() {
                _twoFactorEnabled = value;
              });
            }),
            SizedBox(height: 16.0),
            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  // Save changes
                  setState(() {
                    _isEditing = false;
                  });
                },
                child: Text('Save'),
              )
            else
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = true;
                  });
                },
                child: Text('Edit'),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logout logic here
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      enabled: _isEditing,
    );
  }

  Widget _buildSwitch(String label, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(label),
      value: value,
      onChanged: _isEditing ? onChanged : null,
    );
  }
}
