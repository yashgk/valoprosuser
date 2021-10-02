import 'dart:ui';

import 'package:flutter/material.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Container(
          margin: const EdgeInsets.all(100.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), shape: BoxShape.circle),
          child: const Icon(
            Icons.person,
            size: 50,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "TENZ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 150, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Rank:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 150, top: 8.0),
                  child: Text(
                    "Name:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 150, top: 8.0),
                  child: Text(
                    "Nationality:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 150, top: 8.0),
                  child: Text(
                    "Class:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 150, top: 8.0),
                  child: Text(
                    "Age:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 150, top: 8.0),
                  child: Text(
                    "K/D Ratio:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 150, top: 8.0),
                  child: Text(
                    "Plays For:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
