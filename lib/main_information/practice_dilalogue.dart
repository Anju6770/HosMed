import 'package:batch_bhutan/goggle%20fonts.dart';
import 'package:flutter/material.dart';
class PracticeDilalogue extends StatelessWidget {
  const PracticeDilalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth:MediaQuery.of(context).size.width*0.8,
              color: Colors.deepOrangeAccent,
              onPressed: (){
               showDialog(context: context, builder: (context){
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     AlertDialog(
                       title: Text("Do you want to pay?"),
                       actions: [
                         TextButton(onPressed: (){
                           Navigator.pop(context);
                         }, child: Text("Yes")),
                         TextButton(onPressed: (){
                           Navigator.pop(context);
                         }, child: Text("No"))
                       ],
                     ),
                   ],
                 );
               });
            },
              child: Text("button",style: myStyal(20,Colors.white,FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
