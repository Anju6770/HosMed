import 'package:batch_bhutan/1st_project/data/Home_list.dart';
import 'package:batch_bhutan/1st_project/data/docs_list.dart';
import 'package:batch_bhutan/1st_project/pages/1hospital.dart';
import 'package:batch_bhutan/1st_project/pages/Search_hospital.dart';
import 'package:batch_bhutan/1st_project/pages/carousel.dart';
import 'package:batch_bhutan/1st_project/pages/main_profile.dart';
import 'package:batch_bhutan/1st_project/pages/pro_file.dart';
import 'package:batch_bhutan/1st_project/pages/setting.dart';
import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';

class HomeMine extends StatefulWidget {
  const HomeMine({super.key});

  @override
  State<HomeMine> createState() => _HomeMineState();
}

class _HomeMineState extends State<HomeMine> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ProFile()));
              },
              child: UserAccountsDrawerHeader(
                        accountName: Text("Merry Monsoon",style: Styal(21,Colors.white,FontWeight.bold),),
                        accountEmail: Text('marryMonsoon@gmail.com',style: Styal(21,Colors.white,FontWeight.bold),),
                        currentAccountPicture: Container(
                          height: 80,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/Doctors/pro.jpg',),fit: BoxFit.cover)
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.8),
                        ),
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>MainProfile()));
                    },
                    leading: Icon(
                      Icons.portrait_rounded,
                      size: 35,
                    ),
                    title: Text(
                      "My Profile",
                      style: Styal(20),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsPage()));
                    },
                    leading: Icon(
                      Icons.settings_outlined,
                      size: 35,
                    ),
                    title: Text(
                      "Settings",
                      style: Styal(20),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock_outline,
                      size: 35,
                    ),
                    title: Text(
                      "Privacy and Security",
                      style: Styal(20),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.question_answer_outlined,
                      size: 35,
                    ),
                    title: Text(
                      "Help and Feedback",
                      style: Styal(20),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AlertDialog(
                            title: Text("Do you want to Log Out?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                Carousel()));
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
                                  ))
                            ],
                          ),
                        ],
                      );
                    });
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 35,color: Colors.red,
                ),
                title: Text(
                  "Log Out",
                  style: Styal(20),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(500, 200)),
                  color: secondaryColor.withOpacity(0.6)),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(100, 200)),
                    color: primaryColor.withOpacity(0.4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.notifications,
                              color: primaryColor,
                            )),
                        InkWell(
                          onTap: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: Container(
                              margin: EdgeInsets.all(30),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: Icon(Icons.menu, color: primaryColor)),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(3),
                      height: 50,
                      width: 340,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => SearchDoc()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: primaryColor,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Search...",
                                        style: myStyal(18, Colors.black),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.keyboard_voice_rounded,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "Health Care for your Health",
                        style: myStyal(25),
                        maxLines: 4,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image(
                      image: AssetImage(
                          "assets/image/hosp-removebg-preview.png"),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stay healthy!",
                    style: Styal(27, Colors.black, FontWeight.bold),
                  ),
                  Text(
                    "We are here to help you 24/7 with the best treatment in the world",
                    style: Styal(20),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    "Best Hospitals in Bhutan",
                    style: Styal(26, primaryColor, FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: hospital.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => hospitalProject(
                                homeModel: hospital[index],
                                dos: allDocs[index],
                                index: index,
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("${hospital[index].image}"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.all(2),
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor.withOpacity(0.3),
                            ),
                            child: Center(
                                child: Text(
                              "${hospital[index].name}",
                              style: myStyal(
                                  22, Colors.white, FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     itemCount: hospital.length,
            //     physics: NeverScrollableScrollPhysics(),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 5,
            //       mainAxisSpacing: 5,
            //       childAspectRatio: 0.7,
            //     ),
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         onTap: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (builder) => hospitalProject(
            //                     homeModel: hospital[index],
            //                     dos: allDocs[index],
            //                     index: index,
            //                   )));
            //         },
            //         child: Card(
            //           child: Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20),
            //               color: primaryColor.withOpacity(0.1),
            //             ),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Container(
            //                   height: 100,
            //                   width: 200,
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       image: DecorationImage(
            //                           image: AssetImage(
            //                               "${hospital[index].image}"))),
            //                 ),
            //                 Text(
            //                   "${hospital[index].name}",
            //                   style: myStyal(20, Colors.black, FontWeight.bold),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
