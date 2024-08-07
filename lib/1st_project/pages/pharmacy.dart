import 'package:batch_bhutan/1st_project/data/medicine_list.dart';
import 'package:batch_bhutan/1st_project/data/pharmacy_list.dart';
import 'package:batch_bhutan/1st_project/pages/Pharmacy_details.dart';
import 'package:batch_bhutan/1st_project/pages/Search_pharmacy.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class MedicalShop extends StatelessWidget {
  const MedicalShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.all(30),
                            height: 40,
                            width: 170,
                            decoration: BoxDecoration(
                            ),
                            child: Text("Pharmacy",style: myStyal(34,Colors.white,FontWeight.bold),)
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SearchDoc()));
                      },
                      child: Container(
                        height: 50,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: primaryColor),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.search,color: primaryColor,size: 30,),
                                  SizedBox(width: 20,),
                                  Text("Search",style: myStyal(18,Colors.black,FontWeight.bold),),
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
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: allMedicineShopData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.999,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>MedicalShopDetails(medicineShopModel: allMedicineShopData[index],me: allDrug[index],)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      shadowColor: Colors.white,
                      elevation: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 250,
                            width: 350,
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                image: DecorationImage(
                                    image: AssetImage("${allMedicineShopData[index].shopUrl}",
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${allMedicineShopData[index].shopName}",
                                  style: myStyal(24, Colors.black, FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,color: Colors.blue,),
                                    SizedBox(width: 10,),
                                    Text("${allMedicineShopData[index].location}", style: myStyal(20, Colors.black,FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
