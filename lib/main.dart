import 'package:dictionary/components/home_screen.dart';
import 'package:dictionary/repo/word_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dictionary_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BlocProvider(
        child: HomeScreen(),
        create: (context) => DictionaryCubit(WordRepository()),
      ),
    );
  }
}
