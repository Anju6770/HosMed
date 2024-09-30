import 'package:batch_bhutan/1st_project/model/Home_model.dart';
import 'package:batch_bhutan/1st_project/pages/1ambulance.dart';
import 'package:batch_bhutan/1st_project/pages/doctor_jobs.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class hospitalProject extends StatelessWidget {
  HomeModel homeModel;
  int index;
  List dos;
  hospitalProject({super.key,required this.homeModel,required this.dos,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Container(
              height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("${homeModel.image}"),fit:BoxFit.cover,)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${homeModel.name}",style: Styal(27,Colors.black,FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_pin,size: 26,color: primaryColor,),
                      SizedBox(width: 10,),
                      Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Text("${homeModel.location}",style: Styal(20,),maxLines: 3,)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      launchUrl(
                        Uri.parse("tel:+975 3631112"),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.call_sharp,size: 30,color: secondaryColor,),
                        SizedBox(width: 10,),
                        Text("${homeModel.number}",style: Styal(20,Colors.black,FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("${homeModel.brife}",style: Styal(21,)),
                  SizedBox(height: 20,),
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Views",style: Styal(20)),
                              Text("${homeModel.views}",style: Styal(20,Colors.black,FontWeight.bold)),
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
                              Text("Rating",style: Styal(20)),
                              Text("${homeModel.rating}",style: Styal(20,Colors.black,FontWeight.bold)),
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
                      Text("Services ",style: Styal(28,secondaryColor),),
                      Text("See All ",style: Styal(18),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>HomeDoctors(docs: dos,)));
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("assets/icons/doc.png"))
                                        ),
                                    ),
                                    Text("Speciality",style: myStyal(24),),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 23,color: Colors.grey,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Ambul(index: index,)));
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("assets/icons/amb.png"))
                                      ),
                                    ),
                                    Text("Ambulance",style: myStyal(24),),
                                    Icon(Icons.arrow_forward_ios_outlined,size: 23,color: Colors.grey,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
