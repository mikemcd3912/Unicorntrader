import 'package:app/models/unicorn.dart';
import 'package:app/widgets/unicornListing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    print(response.body);
    Map<String, dynamic> rawJson = json.decode(response.body);
    print(rawJson);
    Iterable<dynamic> items = rawJson['Items'];
    List<Unicorn> unicorns =
        List<Unicorn>.from(items.map((e) => Unicorn.fromMap(e)));
    return unicorns;
  }

  @override
  Widget build(BuildContext context) {
    widget.response = getUnicorns();
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
      body: FutureBuilder<http.Response>(
          future: widget.response,
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasData) {
              widget.unicorns = parseJSON(snapshot.data!);
              return Center(
                child: ListView.builder(
                  itemCount: widget.unicorns.length,
                  itemBuilder: (context, index) {
                    var post = widget.unicorns.elementAt(index);
                    return ListTile(
                      leading: Image.network(post.imageURL!),
                      title: Text(post.name!),
                      subtitle: Text(post.description!),
                    );
                  },
                ),
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
