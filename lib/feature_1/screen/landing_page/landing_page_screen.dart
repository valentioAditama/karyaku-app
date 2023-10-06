import 'package:flutter/material.dart';

class landing_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/LandingPage.jpg"), fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Text("Welcome Back To Karyaku",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              const Text("Imagination Growth Up On Each Letter",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
              const SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text("Start Now")),
            ],
          ),
        ),
      ),
    );
  }
}
