import 'dart:io';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  final _nameController = TextEditingController(text: 'Marry Monsoon');
  final _emailController = TextEditingController(text: 'marryMonsoon@gmail.com');
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500,200)),
                  color: secondaryColor.withOpacity(0.6)
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(100,200)),
                    color: primaryColor.withOpacity(0.4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(5),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                ),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_back),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 40,
                              width: 240,
                              decoration: BoxDecoration(
                              ),
                              child: Text("Edit Profile",style: myStyal(34,Colors.white,FontWeight.bold),)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children:[ GestureDetector(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : AssetImage('assets/Doctors/pro.jpg'),
                        ),
                      ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: _pickImage,
                            child: Container(
                              width: 40,height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Icon(Icons.linked_camera_outlined),
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildProfileField('Name', _nameController),
                  SizedBox(height: 20),
                  _buildProfileField('Email', _emailController),
                  SizedBox(height: 20),
                  if (_isEditing)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = false;
                          // Save changes or update user profile logic
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
                ],
              ),
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
}
