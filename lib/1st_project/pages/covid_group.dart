import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class information extends StatefulWidget {
  const information({super.key});

  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  final videoUrl = "https://www.youtube.com/watch?v=YK_gq3PC7TE";

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=YK_gq3PC7TE")!,
      flags: YoutubePlayerFlags(autoPlay: false));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
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
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(100,200)),
                    color: primaryColor.withOpacity(0.4)
                ),
                child: Center(
                  child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                      ),
                      child: Text("Covid-19",style: myStyal(35,Colors.white,FontWeight.bold),)
                  ),
                ),
              ),

            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child:
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.47,
                          padding: EdgeInsets.all(3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Coronavirus ",style: myStyal(25, Colors.black, FontWeight.bold), maxLines: 1,),
                              Text("Covid-19!", style: myStyal(22, Colors.black, FontWeight.bold), maxLines: 1,),
                              Text("Coronavirus is a contagious disease caused by the coronavirus SARS-CoV-2.",style: myStyal(18, Colors.black, )),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.28,
                          width: MediaQuery.of(context).size.width * 0.44,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular((20)),
                            image: DecorationImage(
                                image: AssetImage("assets/image/covid.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),

                      ],
                    ),

                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
                    width: 500,
                    padding: EdgeInsets.all(5),

                    child:  YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),

                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text("Coronavirus disease 2019 (COVID-19) is a contagious disease caused by the coronavirus. The first known case was identified in Wuhan, China, in December 2019. Most scientists believe the SARS-CoV-2 virus entered into human populations through natural zoonosis, similar to , and consistent with other pandemics in human history.",style: TextStyle(fontSize: 18),),

                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/image/covid-19.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),

                      ),
                    ],
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
