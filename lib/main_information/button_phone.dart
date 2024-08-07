import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ButtonPhone extends StatelessWidget {
  const ButtonPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        MaterialButton(
        color: Colors.green,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        onPressed: () {
          launchUrl(
            Uri.parse("tel:+1-555-010-999"),
          );
        },
        child: Text("Open Phone"),
      ),
      ]
    ),
    );
  }
}
