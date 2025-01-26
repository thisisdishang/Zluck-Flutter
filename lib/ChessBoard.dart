// Create chess board using GridView.builder. Make sure to use the following colors for the tiles
import 'package:flutter/material.dart';

void main() {
  runApp(ChessBoard());
}

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "Lucifer Chess Board",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: 64,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8),
          itemBuilder: (BuildContext context, int index) =>
              (index ~/ 8 + index % 8) % 2 == 1
                  ? Container(color: Colors.black)
                  : Container(
                      color: Colors.white,
                    ),
        ),
      ),
    );
  }
}
