import 'package:batch_bhutan/1st_project/pages/pro_setting.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
class MainProfile extends StatefulWidget {
  const MainProfile({Key?key}): super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500,200)),
                    color: secondaryColor.withOpacity(0.6)
                ),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(100,200)),
                      color: primaryColor.withOpacity(0.4)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
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
                                width: 200,
                                decoration: BoxDecoration(
                                ),
                                child: Text("Profile",style: myStyal(34,Colors.white,FontWeight.bold),)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,height: 150,
                child: ClipRRect(borderRadius: BorderRadius.circular(100),
                    child: Image(image: AssetImage("assets/Doctors/pro.jpg"),fit: BoxFit.cover,)),
              ),
              SizedBox(height: 10,),
              Text("Merry Monsoon",style: myStyal(25,Colors.black,FontWeight.bold),),
              Text('marryMonsoon@gmail.com',style: myStyal(20),),
              SizedBox(height: 20,),
              SizedBox(
                  width: 200,
                  height: 46,
                  child: ElevatedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ProfilePage()));
                  }, child: Text("Edit Profile",style: myStyal(19,Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor
                    ),
                  )
              ),
              SizedBox(height: 30,),
              Divider(),
              SizedBox(height: 15,),
              ListTile(
                leading: Container(
                  width: 50,height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor.withOpacity(0.1),
                  ),
                  child: Icon(Icons.settings_outlined,color: primaryColor),
                ),
                title: Text("Settings",style: myStyal(20),),
                trailing: Container(
                  width: 30,height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: Container(
                  width: 50,height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor.withOpacity(0.1),
                  ),
                  child: Icon(Icons.wallet,color: primaryColor),
                ),
                title: Text("Billing Details",style: myStyal(20),),
                trailing: Container(
                  width: 30,height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: Container(
                  width: 50,height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor.withOpacity(0.1),
                  ),
                  child: Icon(Icons.person_add_alt_1_outlined,color: primaryColor),
                ),
                title: Text("User Management",style: myStyal(20),),
                trailing: Container(
                  width: 30,height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 10,),
              ListTile(
                leading: Container(
                  width: 50,height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: primaryColor.withOpacity(0.1),
                  ),
                  child: Icon(Icons.info_outline_rounded,color: primaryColor),
                ),
                title: Text("Information",style: myStyal(20),),
                trailing: Container(
                  width: 30,height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

