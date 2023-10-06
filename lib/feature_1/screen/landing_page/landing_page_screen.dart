import 'package:flutter/material.dart';

class landing_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/LandingPage.jpg"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Text(
              "welcome",
            ),
          ),
        ),
      ),
    );
  }
}
