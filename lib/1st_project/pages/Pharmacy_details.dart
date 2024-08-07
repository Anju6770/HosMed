import 'package:batch_bhutan/1st_project/model/pharmacy_model.dart';
import 'package:batch_bhutan/1st_project/pages/Medicine_home.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class MedicalShopDetails extends StatelessWidget {
  MedicineShopModel medicineShopModel;
  List me;
  MedicalShopDetails({super.key,required this.medicineShopModel,required this.me});

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
                  image: DecorationImage(image: AssetImage("${medicineShopModel.shopUrl}"),fit:BoxFit.cover,)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(30),
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${medicineShopModel.shopName}",style: myStyal(26,Colors.black,FontWeight.bold),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.location_pin,size: 28,color: primaryColor,),
                              SizedBox(width:5,),
                              Text("${medicineShopModel.location}",style: myStyal(24,Colors.black)),
                            ],
                          ),
                          SizedBox(height: 5,),
                          InkWell(
                            onTap:(){
                              launchUrl(
                                Uri.parse("tel:+975 17119430"),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.phone,size: 28,color: secondaryColor,),
                                SizedBox(width: 10,),
                                Text("${medicineShopModel.contactNo}",style: myStyal(22,Colors.black,FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 78,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor.withOpacity(0.25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("Rating",style: myStyal(20),),
                              Text("${medicineShopModel.rating}",style: myStyal(20,Colors.black,FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("${medicineShopModel.aboutShop}",style: myStyal(21,Colors.black,FontWeight.normal)),
                  SizedBox(height: 20,),
                  InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>medicen(MedClass: me,)));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.teal,
                  ),
                  child: Center(child: Text('Buy Medicine',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),)),
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
