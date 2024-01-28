import 'package:flutter/material.dart';
import './feature_1/screen/auth/login_screen.dart';
import './feature_1/screen/auth/register_screen.dart';
import './feature_1/screen/landing_page/landing_page_screen.dart';
import './feature_1/screen/home/home_screen.dart';
import './feature_1/screen/detail/detail_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), routes: {
      '/landingPage': (context) => landing_page(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/home': (context) => HomeScreen(),
      '/detail': (context) => DetailScreen(),
    });
  }
}
