import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:batch_bhutan/main_information/LogIn.dart';
import 'package:batch_bhutan/main_information/register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> image=[
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
      body: SingleChildScrollView(
        child: Center(
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
                  child: Center(child: Text("Hosmed",style: myStyal(50,Colors.white),)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  CarouselSlider(
                    items: image.map((e) {
                      return Image.asset(e);
                    }).toList(),
                    options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (value, _){
                          setState(() {
                            _currentIndex = value;
                          });
                        }
                    ),
                  ),
                  buildIndicator(),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(15),
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: primaryColor.withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        Text("Top Class Health Care Hospital in Bhutan",style: Styal(25),),
                        Text("Be safe... get help anywhere and anytime with us",style: Styal(19),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Registration()));
                          },
                          child: Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: forthColor
                            ),
                            child: Center(child: Text("Create Account",style: Styal(18,Colors.white,FontWeight.bold),)),
                          ),
                        ),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Login()));
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: forthColor
                            ),
                            child: Center(child: Text("Log In",style: Styal(18,Colors.white,FontWeight.bold),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("or using social media",style: Styal(20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook,size: 40,color: primaryColor,),
                      SizedBox(width: 25,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black
                        ),
                          child: Icon(Icons.tiktok_rounded,size: 32,color: Colors.white,)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < image.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: 7,
            width: i == _currentIndex ? 35 : 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: i == _currentIndex ? Colors.black : Colors.grey,
            ),
          )
      ],
    );
  }
}


