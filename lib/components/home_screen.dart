import 'package:dictionary/bloc/dictionary_cubit.dart';
import 'package:dictionary/components/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Container(
      color: Colors.pink,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            "assets/sponge_bob.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          const Spacer(),
          const Text(
            "Imaginatory",
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Words of your imagination",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
              hintText: "What is your imagination capable of -_- ?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(color: Colors.black),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getWordSearched();
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.pink[100], padding: const EdgeInsets.all(16)),
              child: const Text("SEARCH"),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message) {
    return Center(
        child: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListScreen(state.words),
            ),
          );
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.pink,
          body: cubit.state is WordSearchingState
              ? getLoadingWidget()
              : cubit.state is ErrorState
                  ? getErrorWidget(
                      "You got into the error(((\nplease restart your app")
                  : cubit.state is NoWordSearchedState
                      ? getDictionaryFormWidget(context)
                      : Container()),
    );
  }
}
