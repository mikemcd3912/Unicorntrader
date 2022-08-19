import 'package:flutter/material.dart';
import 'package:app/models/unicorn.dart';


class UnicornListing extends StatelessWidget {
  final Unicorn post;

  const UnicornListing({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(width: 1, color: Colors.black),
        ),
        hoverColor: Colors.lightGreenAccent,
        title: Text(
            '${formatDate(post.date, [DD, ', ', MM, ' ', dd, ', ', yyyy])}',
            style: TextStyle(fontSize: 20)),
        trailing: Text(
          '${post.price}',
          style: TextStyle(fontSize: 25),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailView(post: post),
            ),
          );
        });
  }
}
