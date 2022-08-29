import 'package:app/models/unicorn.dart';
import 'package:app/widgets/unicornListing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FindUnicorn extends StatefulWidget {
  FindUnicorn({Key? key}) : super(key: key);

  @override
  _FindUnicornState createState() => _FindUnicornState();
}

class _FindUnicornState extends State<FindUnicorn> {
  List<Unicorn> page = [];
  int lastPost = 0;

  @override
  Widget build(BuildContext context) {
    List<Unicorn> posts = [];
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          value: 'UnicornTrader',
          label: 'App header',
          child: const Center(
            child: Text(
              'UnicornTrader',
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _getPosts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> response) {
          if (response.hasData) {
            return _content(context, posts);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<List> _getPosts() async {
    List<Unicorn> posts = [];
    return posts;
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
            return UnicornListing(post: posts[index]);
          });
    }
  }
}
