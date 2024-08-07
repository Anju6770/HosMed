import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ProFile extends StatefulWidget {
  const ProFile({super.key});

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/Doctors/pro.jpg',),fit: BoxFit.cover)
                      ),
                    ),
                    Text("Merry Monsoon",style: myStyal(30,Colors.white,FontWeight.bold),),
                    Text('marryMonsoon@gmail.com',style: myStyal(25,Colors.white),),
                  ],
                )
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location: Changzamtog,Thimphu,Bhutan",style: myStyal(20),),
                SizedBox(height: 10,),
                Text("PhonenNo: +975 77564563",style: myStyal(20),),
                SizedBox(height: 10,),
                Text("Date of Birth: 07/11/1992",style: myStyal(20),),
                SizedBox(height: 10,),
                Text("Age: 26",style: myStyal(20),),
                SizedBox(height: 10,),
                Text("Sickness: Suffering from high fever",style: myStyal(20),),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gender",style: Styal(20)),
                      Text("Female",style: Styal(20,Colors.black,FontWeight.bold)),
                    ],
                  ),
                  Container(
                    height: 80,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Weight",style: Styal(20)),
                      Text("56",style: Styal(20,Colors.black,FontWeight.bold)),
                    ],
                  ),
                  Container(
                    height: 80,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Height",style: Styal(20)),
                      Text("156",style: Styal(20,Colors.black,FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap:(){
                    launchUrl(
                      Uri.parse("tel:+975 77564563"),
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.call,color: secondaryColor,size: 30,),
                  ),
                ),
                SizedBox(width: 17,),
                InkWell(
                  onTap: () {
                    launchUrl(
                      Uri.parse(
                          "mailto:marryMonsoon@gmail.com.org?subject=News&body=New%20plugin"),
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.email_outlined,color: Colors.red,size: 30,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
