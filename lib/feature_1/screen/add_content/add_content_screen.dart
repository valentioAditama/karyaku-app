import 'package:flutter/material.dart';
import '../../widgets/bottom_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddContentScreen extends StatefulWidget {
  @override
  _AddContentScreenState createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  int _currentIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final CollectionReference postsCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<void> _addPost() async {
    try {
      await postsCollection.add({
        'title': titleController.text,
        'subTitle': subTitleController.text,
        'description': descriptionController.text,
      });
      print('Post added successfully');
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print('Error adding post: $e');
    }
  }

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
                      "https://source.unsplash.com/random"), // Replace with your actual image URL
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                ),
              ),
              padding: EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Upload Karya Mu Sekarang",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Meningkatkan karir dalam industri kreatif dengan menggunggah karya-karya terbaikmu",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upload Karyamu",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              labelText: "Judul",
                              labelStyle: TextStyle(color: Colors.black87),
                            ),
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: subTitleController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              labelText: "Sub Judul",
                              labelStyle: TextStyle(color: Colors.black87),
                            ),
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              labelText: "Deskripsi Karya mu",
                              labelStyle: TextStyle(color: Colors.black87),
                            ),
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  _addPost();
                },
                child: Text("Submit"),
              ),
            )
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
