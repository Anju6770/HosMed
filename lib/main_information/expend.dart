import 'package:flutter/material.dart';
class Expend extends StatefulWidget {
  const Expend({super.key});

  @override
  State<Expend> createState() => _ExpendState();
}

class _ExpendState extends State<Expend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Demo"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(flex: 1,
              child: Row(
                children: [
                  Expanded(flex:2,child: Expanded( child: Container(color: Colors.red,),)),
                  Expanded(flex:2,child: Column(
                    children: [
                      Expanded(child: Container(color: Colors.yellow,)),
                      Expanded(child: Container(color: Colors.orange,)),
                    ],
                  ),),
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(flex: 1, child: Column(children: [Expanded(child: Container(color: Colors.blue,),),],)),
                  Expanded(flex: 2, child: Column(children: [Expanded(child: Container(color: Colors.purple,),),],))
                ],
              )),
          Expanded(
            flex: 1,
              child: Row(
                children: [
                  Expanded(child: Column(children: [
                    Expanded(child: Container(color: Colors.green,),),
                    Expanded(child: Container(color: Colors.orange,),),
                  ],)),
                  Expanded(child: Column(children: [
                    Expanded(child: Container(color: Colors.red,))
                  ],))
                ],
              )),
          Expanded(
            flex: 1,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.yellow,),),
                  Expanded(child: Container(color: Colors.pinkAccent,),),
                  Expanded(child: Container(color: Colors.tealAccent,),),
                ],
              )),
          Expanded(
            flex: 2,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Row(children: [
                    Expanded(child: Container(color: Colors.blue,)),
                  ],)),
                  Expanded(flex: 2, child: Row(children: [
                    Expanded(child: Column(children: [
                      Expanded(child: Container(color: Colors.purpleAccent,)),
                      Expanded(child: Container(color: Colors.green ,)),
                    ],))
                  ],)),
                  Expanded(child: Container(color: Colors.yellowAccent,)),
                  Expanded(child: Container(color: Colors.orangeAccent,)),
                  Expanded(child: Container(color: Colors.pinkAccent,)),
                ],
              )),
        ],
      ),
    );
  }
}
