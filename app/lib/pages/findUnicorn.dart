import 'package:app/models/unicorn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FindUnicorn extends StatefulWidget {
  late List<Unicorn> unicorns;
  late Future<http.Response> response;

  FindUnicorn({Key? key}) : super(key: key);

  @override
  _FindUnicornState createState() => _FindUnicornState();
}

class _FindUnicornState extends State<FindUnicorn> {
  final String apiEndpoint =
      'http://adec3ffa7d6da4e89b2bc094419032d6-2125423067.us-west-2.elb.amazonaws.com/';

  Future<http.Response> getUnicorns() {
    return http.get(Uri.parse(apiEndpoint));
  }

  List<Unicorn> parseJSON(http.Response response) {
    Map<String, dynamic> rawJson = json.decode(response.body);
    Iterable<dynamic> items = rawJson['Items'];
    List<Unicorn> unicorns =
        List<Unicorn>.from(items.map((e) => Unicorn.fromMap(e)));
    return unicorns;
  }

  @override
  void initState() {
    super.initState();
    widget.response = getUnicorns();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          value: 'UnicornTrader 1.8',
          label: 'App header',
          child: const Center(
            child: Text(
              'UnicornTrader',
            ),
          ),
        ),
      ),
      // body: const Center(child: CircularProgressIndicator())
      body: FutureBuilder<http.Response>(
          future: widget.response,
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasData) {
              widget.unicorns = parseJSON(snapshot.data!);
              return ListView.builder(
                itemCount: widget.unicorns.length,
                itemBuilder: (context, index) {
                  var post = widget.unicorns.elementAt(index);
                  return ListTile(
                    leading: Image.network(post.imageURL!),
                    title: Text(post.name!),
                    subtitle: Text(post.description!),
                    trailing: Text('Price: \$${post.price!}'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Icon(Icons.error_outline_sharp));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
