import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
class detailsOfDoctors extends StatefulWidget {
  List  category;
  detailsOfDoctors({super.key,required this.category});

  @override
  State<detailsOfDoctors> createState() => _detailsOfDoctorsState();
}

class _detailsOfDoctorsState extends State<detailsOfDoctors> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500,200)),
                  color: secondaryColor.withOpacity(0.6)
              ),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(100,200)),
                    color: primaryColor.withOpacity(0.4)
                ),
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
                              margin: EdgeInsets.all(20),
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
                            width: 150,
                            decoration: BoxDecoration(
                            ),
                            child: Text("Doctors",style: myStyal(30,Colors.white,FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.category.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.6,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(image: AssetImage("${widget.category[index].image}")),
                                    color: primaryColor.withOpacity(0.6),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.04,
                                        width: MediaQuery.of(context).size.width*0.4,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: forthColor,
                                        ),
                                        child: Center(child: Text("${widget.category[index].experience} Exp.",style: Styal(20,Colors.white),)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width*0.45,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${widget.category[index].name}",style: Styal(22),),
                                      Text("${widget.category[index].speciality}",style: Styal(18),),
                                      Row(
                                        children: [
                                          Text("\$",style: Styal(20,Colors.black,FontWeight.bold),),
                                          SizedBox(width: 6,),
                                          Text("${widget.category[index].payment} ",style: Styal(18),),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap:(){
                                              launchUrl(
                                                Uri.parse("tel:+975 17564323"),
                                              );
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(color: primaryColor),
                                              ),
                                              child: Icon(Icons.call,color: secondaryColor,),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: primaryColor),
                                            ),
                                            child: Icon(Icons.video_call,color: primaryColor,),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: primaryColor),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Icon(Icons.message,color: secondaryColor,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                                color: primaryColor.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Top Rating",style: Styal(18,Colors.grey),),
                                        Text("${widget.category[index].rating}",style: Styal(18,Colors.black,FontWeight.bold),),
                                      ],
                                    ),
                                    Container(
                                      height: 80,
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Patients",style: Styal(18,Colors.grey),),
                                        Text("${widget.category[index].patientNo}",style: Styal(20,Colors.black,FontWeight.bold),),
                                      ],
                                    ),
                                    Container(
                                      height: 80,
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Exp.years",style: Styal(18,Colors.grey),),
                                        Text("${widget.category[index].experience}",style: Styal(20,Colors.black,FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.02,
                                  width:MediaQuery.of(context).size.width*0.87,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500,100),bottomRight: Radius.elliptical(500,100),),
                                    color: primaryColor.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Center(
                              child: MaterialButton(
                                color: primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                height: MediaQuery.of(context).size.height*0.05,
                                minWidth: MediaQuery.of(context).size.width*0.8,
                                onPressed: (){},
                                child: Text("Make an Appointment",style: myStyal(22,Colors.white,FontWeight.bold),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
