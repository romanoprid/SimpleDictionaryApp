import 'package:flutter/material.dart';
import 'package:jokes_app/service/api.dart';
import 'package:jokes_app/model/jokes_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JokesPage extends StatefulWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  _JokesPageState createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {
  Future<List<Joke>> _getJokes() async {
    var data = await http.get(uri);

    var jsonData = json.decode(data.body);

    List<Joke> jokes = [];

    for (var item in jsonData["result"]) {
      Joke newJoke = Joke(item["created_at"], item["icon_url"], item["id"],
          item["url"], item["value"]);
      jokes.add(newJoke);
    }

    return jokes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.green[200],
      child: FutureBuilder(
        future: _getJokes(),
        builder: (BuildContext context, AsyncSnapshot item) {
          if (item.data == null) {
            return Container(
              color: Colors.green[200],
              child: const Center(
                child: Text(
                  "Loading",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: item.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.data[index].iconUrl),
                  ),
                  title: Text(
                    item.data[index].value,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(item.data[index].createdAt),
                );
              },
            );
          }
        },
      ),
    ));
  }
}
