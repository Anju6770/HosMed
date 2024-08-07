import 'package:batch_bhutan/1st_project/data/SignIn_list.dart';
import 'package:flutter/material.dart';
class DemoUi extends StatelessWidget {
  const DemoUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${userData[0].email}"),
      ),
    );
  }
}
