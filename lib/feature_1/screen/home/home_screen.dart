import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final CollectionReference postsCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<void> _deletePost(String postId) async {
    try {
      await postsCollection.doc(postId).delete();
      print('Post deleted successfully');
    } catch (e) {
      print('Error deleting post: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: postsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/home.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Search Art for you get Inspiration",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      "Inspiration for work, culture, and more from people all over the world.",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var post = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.network(
                              "https://source.unsplash.com/random/street-photography", // Replace with your image field
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    post[
                                        'title'], // Replace with your title field
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Container(height: 10),
                                  Text(
                                    post[
                                        'subTitle'], // Replace with your description field
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Spacer(),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.transparent,
                                        ),
                                        child: const Text(
                                          "DELETE",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          _deletePost(post.id);
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.transparent,
                                        ),
                                        child: const Text(
                                          "EDIT",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {},
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.transparent,
                                        ),
                                        child: const Text(
                                          "EXPLORE",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/detail',
                                              arguments: {
                                                'postId': post.id,
                                                // ... (mungkin Anda ingin menyertakan data lainnya)
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_content');
        },
        child: Icon(Icons.add),
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
