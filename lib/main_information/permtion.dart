import 'dart:io';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class TakeImage extends StatefulWidget {
  const TakeImage({super.key});

  @override
  State<TakeImage> createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {

  File? _image;

  Future imageFromGallery()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage == null) return;
    setState(() {
      _image = File(returnImage!.path);
    });
  }
  Future imageFromCamara()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnImage == null) return;
    setState(() {
      _image = File(returnImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (context){
              return Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){
                      imageFromCamara();
                      Navigator.pop(context);
                    }, icon: Icon(Icons.camera_alt),),

                    IconButton(onPressed: (){
                      imageFromGallery();
                      Navigator.pop(context);
                    }, icon: Icon(Icons.image))

                  ],
                ),
              );
            },
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Column(
              children: [
                _image != null ? Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(image: FileImage(_image!),fit: BoxFit.cover)
                  ),
                ) : Container(
                  height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/Doctors/pro.png"),fit: BoxFit.cover),
                    ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Icon(Icons.email,size: 30,color: primaryColor,),
                Text("Email",style: Styal(18),),
                Text("data")
              ],
            ),
          ),
        ],
      ),
    );
  }
}