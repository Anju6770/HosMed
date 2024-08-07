import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Bighome extends StatefulWidget {
  const Bighome({super.key});

  @override
  State<Bighome> createState() => _CarouselState();
}

class _CarouselState extends State<Bighome> {
  final List<String> image=[
    "assets/image/mongar.jpg",
    "assets/image/thimphu.jpg",
    "assets/image/phuntsholing hospital.jpg",
    "assets/image/Bumthang.jpg",
    "assets/image/Tsimalakha.jpg",
    "assets/image/Chhukha.jpg",
  ];
  final List<String> text=[
    "assets/image/mongar.jpg",
    "assets/image/thimphu.jpg",
    "assets/image/phuntsholing hospital.jpg",
    "assets/image/Bumthang.jpg",
    "assets/image/Tsimalakha.jpg",
    "assets/image/Chhukha.jpg",
  ];

  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500,200)),
                  color: secondaryColor.withOpacity(0.6)
              ),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(100,200)),
                    color: primaryColor.withOpacity(0.4)
                ),
                child: Center(child: Text("Hosmed",style: myStyal(30,Colors.white),)),
              ),
            ),
            SizedBox(height: 340,),
            CarouselSlider(
              items: image.map((e) {
                return Image.asset(e);
              }).toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlayInterval: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.6,
                  onPageChanged: (value, _){
                    setState(() {
                      _currentIndex = value;
                    });
                  }
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}


