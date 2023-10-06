import 'package:flutter/material.dart';
import './feature_1/screen/auth/login_screen.dart';
import './feature_1/screen/auth/register_screen.dart';
import './feature_1/screen/landing_page/landing_page_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: landing_page(),
    );
  }
}
