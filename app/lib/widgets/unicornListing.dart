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
      title: Text("TesT"),
      trailing: Text(
        '${post.price}',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
