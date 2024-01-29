import 'package:flutter/material.dart';
import 'package:karyaku_app/feature_1/screen/add_content/add_content_screen.dart';
import 'package:karyaku_app/feature_1/screen/edit_content/edit_content.dart';
import './feature_1/screen/auth/login_screen.dart';
import './feature_1/screen/auth/register_screen.dart';
import './feature_1/screen/landing_page/landing_page_screen.dart';
import './feature_1/screen/home/home_screen.dart';
import './feature_1/screen/detail/detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: landing_page(), routes: {
      '/landingPage': (context) => landing_page(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/home': (context) => HomeScreen(),
      '/detail': (context) => DetailScreen(),
      '/add_content': (context) => AddContentScreen(),
      '/edit_content': (context) => EditContentScreen(),
    });
  }
}
