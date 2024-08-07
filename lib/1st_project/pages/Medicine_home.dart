import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
class medicen extends StatelessWidget {
  List MedClass;
  medicen({super.key,required this.MedClass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500,200)),
                  color: secondaryColor.withOpacity(0.6)
              ),
              child: Container(
                height: 280,
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
                              margin: EdgeInsets.all(10),
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
                            child: Text("Medicine",style: myStyal(35,Colors.white,FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: MedClass.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio:0.55),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage('${MedClass[index].ImUrl}'),
                                          fit: BoxFit.fill)
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
              
                                      Text("${MedClass[index].MedName}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                      Text("Weight:${MedClass[index].Kg}",style: TextStyle(fontSize: 16,color: Colors.black),),
                                      Text('Price: ${MedClass[index].Amount}', style: TextStyle(fontSize: 16,color: Colors.black),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                // MaterialButton(
                                //   elevation: 4,
                                //   onPressed: () {
                                //   },
                                //   child: Container(
                                //     width: 90,
                                //     height: 40,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(20),
                                //       color: primaryColor,
                                //     ),
                                //     child: Center(child: Text('Buy', style: myStyal(20,Colors.white,FontWeight.bold),)),                ),
                                // ),
                                MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              AlertDialog(
                                                title: Text("Do you want to buy?"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Yes",
                                                        style: Styal(19),
                                                      )),
                                                  SizedBox(
                                                    width: 120,
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "No",
                                                        style: Styal(19),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Container(
                                    width: 90,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primaryColor,
                                    ),
                                    child: Center(child: Text('Buy', style: myStyal(20,Colors.white,FontWeight.bold),)),),
                                ),
                              ],
                            )
                        ),
                      );
                    },
                  ) ,
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
