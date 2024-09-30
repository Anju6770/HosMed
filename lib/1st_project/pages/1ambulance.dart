import 'package:batch_bhutan/1st_project/data/ambluance_list.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Ambul extends StatefulWidget {
  // List ambul;
  int index;
  Ambul({super.key,required this.index});

  @override
  State<Ambul> createState() => _AmbulState();
}

class _AmbulState extends State<Ambul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140,
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
                            width: 250,
                            decoration: BoxDecoration(
                            ),
                            child: Text("Ambulance",style: myStyal(34,Colors.white,FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("${ambulancesList[widget.index].brief}",style: Styal(29,Colors.black,FontWeight.bold),),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("${ambulancesList[widget.index].image}"),fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      elevation: 4,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  height: 70,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: AssetImage("assets/icons/ambulance.png")),
                                    color: forthColor.withOpacity(0.3),
                                  ),
                                ),
                                SizedBox(width: 29,),
                                Column(
                                  children: [
                                    Text("Ambulance",style: Styal(25,Colors.black,FontWeight.bold),),
                                    Text("${ambulancesList[widget.index].booked}  Ambulances",style: Styal(18),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  height: 70,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: AssetImage("assets/icons/driver (1).png")),
                                    color: forthColor.withOpacity(0.3),
                                  ),
                                ),
                                SizedBox(width: 29,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Driver",style: Styal(25,Colors.black,FontWeight.bold),),
                                    Text("${ambulancesList[widget.index].booked}  Drivers",style: Styal(18),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  height: 70,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: AssetImage("assets/icons/doctors.png")),
                                    color: forthColor.withOpacity(0.3),
                                  ),
                                ),
                                SizedBox(width: 29,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Staff",style: Styal(25,Colors.black,FontWeight.bold),),
                                    Text("${ambulancesList[widget.index].booked}  Staffs",style: Styal(18),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Views: ",style: Styal(17,primaryColor)),
                              Text("${ambulancesList[widget.index].views}",style: Styal(17),),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(child: Text("${ambulancesList[widget.index].rating}",style: Styal(17,),)),
                        ),
                        InkWell(
                          onTap:(){
                            launchUrl(
                              Uri.parse("tel:+975 17564323"),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.call,color: secondaryColor,),
                                SizedBox(width: 5,),
                                Text("${ambulancesList[widget.index].number}",style: Styal(17)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            })
            //Image(image: AssetImage("${}"))
          ],
        ),
      ),
    );
  }
}
