import 'package:flutter/material.dart';
class Snak extends StatefulWidget {
  const Snak({super.key});

  @override
  State<Snak> createState() => _SnakState();
}

class _SnakState extends State<Snak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
       final snackBar = SnackBar(
          content: Text("Login Successful"),
         behavior: SnackBarBehavior.floating,
         action: SnackBarAction(label: "Cancel", onPressed: (){}),
       );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }),
    );
  }
}
