import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnicornTrader'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text('Hello!')],
        ),
      ),
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Navigation")),
          ListTile(
            title: Text("All Listings"),
          ),
          ListTile(title: Text("My Posts")),
          ListTile(
            title: Text("My Account"),
          ),
        ],
      ),
    );
  }
}
