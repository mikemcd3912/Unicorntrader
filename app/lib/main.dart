import 'package:flutter/material.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/addUnicorn.dart';
import 'package:app/pages/findUnicorn.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
        maximumSize: const Size(800.0, 1600),
        builder: (context) {
          return MaterialApp(
            routes: {
              '/': (context) => FindUnicorn(),
              '/add': (context) => const AddUnicorn(),
              '/myPosts': (context) => FindUnicorn(),
              '/findUnicorn': (context) => FindUnicorn(),
            },
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
