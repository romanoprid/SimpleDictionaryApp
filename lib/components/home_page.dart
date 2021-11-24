import 'package:flutter/material.dart';
import 'package:jokes_app/components/jokes_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[200],
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "World of Jokes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Image.asset(
              "assets/chuck_norris.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Let's find\n some interesting jokes\n with Chuck Norris",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "*Remove children from the screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JokesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[300],
                    padding: const EdgeInsets.all(16)),
                child: const Text("GET STARTED"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
