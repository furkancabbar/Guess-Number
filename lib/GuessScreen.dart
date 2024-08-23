// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/ResultScreen.dart';

class GuessScreen extends StatefulWidget {
  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  var tfGuess = TextEditingController();
  int randomNumber = 0;
  int remaining = 5;
  String orientation = "";

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(101); //0  - 100
    print("Random Number : $randomNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Remaining : $remaining",
              style: TextStyle(color: Colors.pink, fontSize: 30),
            ),
            Text(
              "Clue : $orientation",
              style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfGuess,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Guess",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "GUESS",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  setState(() {
                    remaining = remaining - 1;
                  });

                  int tahmin = int.parse(tfGuess.text);

                  if (tahmin == randomNumber) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(result: true)));
                    return;
                  }

                  if (tahmin > randomNumber) {
                    setState(() {
                      orientation = "Decrement the guess";
                    });
                  }

                  if (tahmin < randomNumber) {
                    setState(() {
                      orientation = "Increment the guess";
                    });
                  }

                  if (remaining == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(result: false)));
                  }

                  tfGuess.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
