// Create a simple photo gallery app using GridView. Display images in a grid format with 3 columns and 5 rows.
import 'package:flutter/material.dart';

void main() {
  runApp(Gallery());
}

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Gallary App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: [
            Image.network('https://picsum.photos/250?image=11'),
            Image.network('https://picsum.photos/250?image=23'),
            Image.network('https://picsum.photos/250?image=33'),
            Image.network('https://picsum.photos/250?image=41'),
            Image.network('https://picsum.photos/250?image=54'),
            Image.network('https://picsum.photos/250?image=62'),
            Image.network('https://picsum.photos/250?image=7'),
            Image.network('https://picsum.photos/250?image=48'),
            Image.network('https://picsum.photos/250?image=19'),
            Image.network('https://picsum.photos/250?image=10'),
            Image.network('https://picsum.photos/250?image=21'),
            Image.network('https://picsum.photos/250?image=22'),
            Image.network('https://picsum.photos/250?image=13'),
            Image.network('https://picsum.photos/250?image=14'),
            Image.network('https://picsum.photos/250?image=15'),
          ],
        ),
      ),
    );
  }
}
