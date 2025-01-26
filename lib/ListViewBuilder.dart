// Create app using ListView.builder to display a scrollable list containing the names of your 10 friends, with each name as a separate item.
import 'package:flutter/material.dart';

void main() {
  runApp(Friends());
}

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> myFriend = [
      "Gautam",
      "Harshiv",
      "Sahil",
      "Harsh",
      "Jignesh",
      "Pranay",
      "Krishna",
      "Piyush",
      "Parth",
      "Sanjay"
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Friends",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: ListView.builder(
          itemCount: myFriend.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(myFriend[index]),
          ),
        ),
      ),
    );
  }
}
