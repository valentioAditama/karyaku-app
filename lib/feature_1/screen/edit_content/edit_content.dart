import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditContentScreen extends StatefulWidget {
  @override
  _EditContentScreenState createState() => _EditContentScreenState();
}

class _EditContentScreenState extends State<EditContentScreen> {
  late String postId; // ID postingan
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Menerima argumen dari rute sebelumnya
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    postId = arguments['postId'];

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
                    "Update Karya Mu Sekarang",
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
                          "Update Karyamu",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: _titleController,
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
                            controller: _subTitleController,
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
                            controller: _descriptionController,
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
                  _updatePost();
                },
                child: Text("Update"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _updatePost() async {
    try {
      // Mengambil data saat ini dari Firestore
      var postSnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .get();

      // Mengambil data yang ingin diubah
      var postData = postSnapshot.data() as Map<String, dynamic>;

      // Update data sesuai dengan nilai yang diinput pengguna
      postData['title'] = _titleController.text;
      postData['subTitle'] = _subTitleController.text;
      postData['description'] = _descriptionController.text;

      // Memperbarui data di Firestore
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update(postData);

      print('Post updated successfully');
      Navigator.pop(context); // Kembali ke halaman sebelumnya
    } catch (e) {
      print('Error updating post: $e');
    }
  }
}
