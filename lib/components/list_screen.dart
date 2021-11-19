import 'package:dictionary/components/detail_screen.dart';
import 'package:dictionary/model/word_response.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<WordResponse> words;

  const ListScreen(this.words, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            words[index].word,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(words[index]),
              ),
            );
          },
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.white,
        ),
        itemCount: words.length,
      ),
    );
  }
}
