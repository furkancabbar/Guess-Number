// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  const SonucEkrani({
    Key? key,
    required this.sonuc,
  }) : super(key: key);

  final bool sonuc;

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuc Ekrani"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc
                ? Image.asset("img/mutlu_resim.png")
                : Image.asset("img/uzgun_resim.png"),
            Text(
              widget.sonuc ? "Kazandınız" : "Kaybettiniz",
              style: TextStyle(color: Colors.black54, fontSize: 36.0),
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "TEKRAR DENE",
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
