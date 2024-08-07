import 'package:batch_bhutan/1st_project/pages/Home.dart';
import 'package:batch_bhutan/1st_project/pages/covid_group.dart';
import 'package:batch_bhutan/1st_project/pages/pharmacy.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});
  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();}
class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    HomeMine(),
   // ProFile(),
    MedicalShop(),
    information()
  ];
  List<Icon> allItems = [
    Icon(Icons.home,color: Colors.white,),
   // Icon(Icons.person,color: Colors.white,),
    Icon(Icons.medication_liquid_outlined,color: Colors.white,),
    Icon(Icons.coronavirus_sharp,color: Colors.white,)
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: primaryColor.withOpacity(0.6),

        buttonBackgroundColor:primaryColor.withOpacity(0.8),
        index: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {
          });
        },
        items: allItems,
      ),
    );  }
}