import 'package:batch_bhutan/1st_project/data/1doctors_list.dart';
import 'package:batch_bhutan/1st_project/data/specialty_list.dart';
import 'package:batch_bhutan/1st_project/pages/1doctors_home.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Search_speciality.dart';
class HomeDoctors extends StatelessWidget {
  // Docs docs;
  List docs;
  HomeDoctors({super.key,required this.docs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  SingleChildScrollView(
       child: Column(
         children: [
           Container(
              height: 170,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              margin: EdgeInsets.all(30),
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back),
                                ],
                              )
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(30),
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                            ),
                            child: Text("Speciality",style: myStyal(30,Colors.white,FontWeight.bold),)
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SearchDoc()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(3),
                        height: 50,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.search,color: primaryColor,size: 30,),
                                      SizedBox(width: 20,),
                                      Text("Search...",style: myStyal(18,Colors.black),),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_voice_rounded,size: 30,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   itemCount: 1,
                   shrinkWrap: true,
                   itemBuilder: (context,index){
                    return Image(image: AssetImage("${docs[index].image}"));
                   },
                 ),
                 ListView.builder(
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: jobs.length,
                     shrinkWrap: true,
                     itemBuilder: (context,index){
                   return Container(
                     margin: EdgeInsets.all(10),
                     height: 95,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       border: Border.all(color: secondaryColor),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: InkWell(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>detailsOfDoctors(category: listed[index],)));
                       },
                       child: Row(
                         children: [
                           Container(
                             width: 100,
                             height: 95,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 image: DecorationImage(image: AssetImage("${jobs[index].image}"))
                             ),
                           ),
                           SizedBox(width: 15,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                   width: MediaQuery.of(context).size.width*0.5,
                                   child: Text("${jobs[index].name}",style: Styal(20),maxLines: 2,)),
                               Center(child: Text("${jobs[index].doc}",style: Styal(17,primaryColor),)),
                             ],
                           ),
                         ],
                       ),
                     ),
                   );
                 })
               ],
             ),
           ),
         ],
       ),
     ),
    );
  }
}
