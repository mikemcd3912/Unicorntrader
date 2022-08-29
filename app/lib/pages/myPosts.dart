import 'package:app/models/unicorn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyPosts extends StatefulWidget {
  MyPosts({Key? key}) : super(key: key);

  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  int totalWaste = 0;
  List<Unicorn> feed = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          feed = [];
          if (snapshot.hasData && snapshot.data!.docs.length > 0) {
            totalWaste = 0;
            snapshot.data!.docs.forEach((element) {
              var postMap = element.data() as Map<String, dynamic>;
              totalWaste = totalWaste + postMap['quantity'] as int;
              feed.add(WasteEntry.fromMapTimeStamp(postMap));
            });
            feed.sort((a, b) => b.date.compareTo(a.date));
          }
          return Scaffold(
            appBar: AppBar(
              title: Semantics(
                value: 'Waste-a-gram - $totalWaste',
                label: 'App header',
                child: Center(
                  child: Text(
                    'Waste-a-gram - $totalWaste',
                    style: TextStyle(fontFamily: 'Cedar', fontSize: 25),
                  ),
                ),
              ),
            ),
            body: _content(context, feed),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _bigFAB(context),
          );
        });
  }

  Widget _bigFAB(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () async {
            var newImageType = false;
            if (await confirm(
              context,
              title: Text('Select Image Type'),
              content: Text(
                  'Would you like to select an image from Device storage or Take a new Photo?'),
              textOK: Text('Select an image From Device'),
              textCancel: Text('Take a new Photo with the Camera'),
            )) {
              newImageType = true;
            }
            var image = await _getPhoto(_picker, newImageType);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewPost(image: File(image!.path))));
          },
          tooltip: 'Add New Post',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}

Widget _content(BuildContext context, List posts) {
  if (posts.isEmpty) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostTile(post: posts[index]);
        });
  }
}
