import 'dart:async';
import 'package:batch_bhutan/1st_project/pages/carousel.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (builder) => Carousel()),
                (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/Doctors/logo.png"))
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
