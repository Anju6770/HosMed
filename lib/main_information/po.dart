import 'dart:io';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeImages extends StatefulWidget {
  const TakeImages({super.key});

  @override
  State<TakeImages> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImages> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle errors, e.g., permission issues
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.camera_alt),
                    ),
                    IconButton(
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add_a_photo),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Column(
              children: [
                _image != null
                    ? Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Doctors/pro.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Icon(Icons.email, size: 30, color: primaryColor),
                Text("Email", style: Styal(18)),
                Text("data"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}