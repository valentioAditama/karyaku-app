import 'package:flutter/material.dart';
import 'package:karyaku_app/feature_1/screen/auth/login_screen.dart';
import 'package:karyaku_app/feature_1/screen/auth/register_screen.dart';
import 'package:karyaku_app/feature_1/screen/landing_page/landing_page_screen.dart';
import '../../widgets/bottom_navigation.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200, // Set the height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1507297448044-a99b358cd06e?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), // Replace with your actual image URL
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken)),
              ),
              padding: EdgeInsets.only(right: 16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Force Majeure is a fashion label based in Montreal",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "We aim to create quality timeless design pieces that will elevate your everyday lifestyle",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1507297448044-a99b358cd06e?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Force Majeure is a fashion label based in Montreal",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          "We aim to create quality timeless design pieces that will elevate your everyday lifestyle",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0), 
                        child: Column(
                          children: [
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ligula magna, dictum sed ex vitae, fringilla fermentum mi. Duis venenatis id nulla dictum placerat. Integer eu quam velit. Quisque sed lectus sit amet justo condimentum dignissim. Vivamus accumsan nibh nec rhoncus eleifend. Nulla laoreet pharetra felis sed rutrum. Sed tristique fermentum lectus, sit amet aliquet leo maximus ac. Cras pretium rutrum ipsum in sodales. Suspendisse ut magna elit. Suspendisse dignissim mattis maximus. Aenean vel leo non tellus interdum posuere. Donec cursus laoreet massa. Pellentesque at commodo dui, eget cursus massa. Praesent a elit vitae libero luctus faucibus sed sit amet mi. Suspendisse potenti. Morbi sed pretium lorem. Aliquam egestas vestibulum aliquam. Duis placerat, libero vitae varius sodales, nisl ipsum gravida leo, tincidunt bibendum nunc massa eget risus. Proin tincidunt dictum molestie. Praesent purus odio, euismod ac vehicula sed, porta sed lorem. Nulla rhoncus sapien eros, at rhoncus est ultrices ut. Suspendisse pretium dignissim efficitur. Maecenas ut neque sed est pellentesque aliquet ac ut arcu. Curabitur blandit euismod tortor, ac vestibulum leo lobortis nec. Mauris vitae ante eget diam elementum porta ac nec ligula. Morbi elementum tortor eu erat auctor pretium. Nulla viverra vel sem ut tincidunt.Ut aliquet pulvinar vulputate. Nunc lacus purus, sollicitudin ut imperdiet a, iaculis ut diam. Praesent congue nisi mi, eget fermentum orci tempor sed. Nullam elit nulla, venenatis non lacinia a, scelerisque et metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean viverra elit vitae arcu scelerisque, ac egestas augue lobortis. In et sem eu sem venenatis vestibulum at non erat. Nam lacus risus, ornare at tellus non, pulvinar ultrices velit. Etiam a lacinia diam. Fusce mattis, nunc non tempus ornare, enim nunc porta mi, quis eleifend purus massa pellentesque ante. Aenean turpis nisi, sollicitudin ut nisl sit amet, gravida pellentesque nunc. Etiam nec turpis ac nulla venenatis bibendum. Donec lacus turpis, interdum eu est vel, aliquet volutpat risus. Duis velit lacus, sodales a fringilla a, suscipit sit amet enim. Etiam sit amet tellus nibh. Pellentesque sit amet leo elit. Nunc faucibus eleifend sodales. In sit amet volutpat metus. Donec dapibus fringilla mi, quis viverra ligula cursus eget. Aenean mattis, lacus tempus euismod fermentum, nunc arcu condimentum neque, id malesuada dui ipsum ultrices orci. Nunc commodo massa at urna pulvinar vehicula. Vestibulum interdum dolor porta, mollis ante quis, pharetra urna. Vestibulum sed dapibus ante, vitae dapibus mauris. Curabitur ut fringilla odio. Vivamus et elit semper, fermentum nunc vitae, finibus est. Aenean pharetra elit vel molestie aliquet. Nunc ligula justo, laoreet at eros vitae, vehicula vestibulum mauris. Suspendisse hendrerit ornare vehicula. Vivamus mauris turpis, ultricies non mauris at, iaculis rutrum elit. Aenean id quam consequat, sodales nulla ut, tincidunt libero. Curabitur sit amet eros dignissim, efficitur sapien nec, ultricies mauris.")
                          ],
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
