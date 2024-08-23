// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  final bool result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.result
                ? Image.asset("img/mutlu_resim.png")
                : Image.asset("img/uzgun_resim.png"),
            Text(
              widget.result ? "Congratulations" : "Sorry",
              style: TextStyle(color: Colors.black54, fontSize: 36.0),
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  widget.result ? "YOU WON! PLAY AGAIN" : "TRY AGAIN",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
