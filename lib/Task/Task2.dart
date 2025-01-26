import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfiniteList(),
    );
  }
}

// Create a Flutter application that displays a list of images of puppies in a ListView.
class PuppieImage extends StatelessWidget {
  const PuppieImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Puppies Image"),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg',
            height: 150,
            width: 150,
          ),
          Image.network(
            'https://images.pexels.com/photos/1458916/pexels-photo-1458916.jpeg',
            height: 150,
            width: 150,
          ),
          Image.network(
            'https://images.pexels.com/photos/59523/pexels-photo-59523.jpeg',
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}

// Create a Todo List application that displays a list of todos in a ListView.
class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List App"),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 1,
            child: ListTile(
              title: Text('Go to Office'),
              subtitle: Text('Go to Office at 9:00 AM'),
            ),
          ),
          Card(
            elevation: 1,
            child: ListTile(
              title: Text('Form Fill'),
              subtitle: Text('Fill college form at 7:00 PM'),
            ),
          ),
        ],
      ),
    );
  }
}

// Create a Flutter application that shows a Chessboard using GridView.
class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (BuildContext context, int index) =>
            (index ~/ 8 + index % 8) % 2 == 1
                ? Container(color: Colors.black)
                : Container(
                    color: Colors.white,
                  ),
      ),
    );
  }
}

// Create a simple ListView in Flutter that displays a list of ten strings. Each item in the list should be displayed as a text widget.
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

    return Scaffold(
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
    );
  }
}

// Display a list of numbers from 1 to 50. Each number should be shown in a separate list item.
class NumberList extends StatelessWidget {
  const NumberList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number From 1 to 50"),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) => Text("${index + 1}"),
      ),
    );
  }
}

// Create a ListView.builder that displays a list of names. If a name starts with the letter ‘A’,
// it should be displayed with a green color; otherwise, it should be displayed in red.
class FilterName extends StatelessWidget {
  const FilterName({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> myFriend = [
      "Gautam",
      "Ankit",
      "Harshiv",
      "Sahil",
      "Aryan",
      "Harsh",
      "Jignesh",
      "Pranay",
      "Ajay",
      "Krishna",
      "Piyush",
      "Parth",
      "Sanjay"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: myFriend.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: myFriend[index].toLowerCase().startsWith("a".toLowerCase())
              ? Text(
                  myFriend[index],
                  style: TextStyle(color: Colors.green),
                )
              : Text(
                  myFriend[index],
                  style: TextStyle(color: Colors.red),
                ),
        ),
      ),
    );
  }
}

// Create a horizontal ListView that displays a list of images. Ensure that the ListView scrolls horizontally.
class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal ListView"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.network('https://picsum.photos/250?image=11'),
          Image.network('https://picsum.photos/250?image=23'),
          Image.network('https://picsum.photos/250?image=33'),
          Image.network('https://picsum.photos/250?image=41'),
          Image.network('https://picsum.photos/250?image=54'),
          Image.network('https://picsum.photos/250?image=62'),
          Image.network('https://picsum.photos/250?image=7'),
        ],
      ),
    );
  }
}

// Implement a ListView inside another ListView. The outer ListView should have three items, and
// each item should contain an inner ListView with five text items.
class NestedListView extends StatelessWidget {
  const NestedListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> outerItems = ['Item 1', 'Item 2', 'Item 3'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested ListView'),
      ),
      body: ListView.builder(
        itemCount: outerItems.length,
        itemBuilder: (context, outerIndex) {
          return Container(
            color: Colors.grey,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Outer ListView item title
                Text(
                  outerItems[outerIndex],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // Inner ListView inside each outer item
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, innerIndex) {
                      return ListTile(
                        title: Text('Inner Item ${innerIndex + 1}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Implement a GridView with a two-column layout. Populate it with 20 square containers, each with a unique color or decoration.
class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text('GridView With Unique Colors:-'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 20, // Space between columns
          mainAxisSpacing: 20, // Space between rows
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.primaries[random.nextInt(Colors.primaries.length)],
            child: Center(
              child: Text(
                'Color ${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Use GridView.builder to create a grid of items where each item has a different aspect ratio.
// For example, alternate between items with a 1:1 and 2:1 aspect ratio
class DifferentGridView extends StatelessWidget {
  const DifferentGridView({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text("Different Ratio GridView"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          // Generate random aspect ratios (1:1, 2:1)
          double aspectRatio = random.nextBool() ? 2 / 1 : 1 / 1;

          // Adjust height for random aspect ratios
          return Container(
            height: aspectRatio == 2 / 1
                ? 120
                : 60, // Height depends on aspect ratio
            color: Colors.primaries[random.nextInt(Colors.primaries.length)],
            child: Center(
              child: Text(
                'Item $index\n${aspectRatio.toStringAsFixed(1)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Create a GridView where the number of columns changes based on the device orientation (portrait or landscape).
class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive GridView"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.primaries[random.nextInt(Colors.primaries.length)],
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Implement an infinite scrolling ListView using ListView.builder, where more items are loaded when the user scrolls to the end of the list.
class InfiniteList extends StatefulWidget {
  const InfiniteList({super.key});

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _data = List.generate(20, (index) => index);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      // Load more data or trigger pagination in flutter
      setState(() {
        _data.addAll(List.generate(10, (index) => _data.length + index));
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite List using Pagination"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _data.length,
        itemBuilder: (context, index) => Container(
          height: 100,
          margin: EdgeInsets.all(5),
          color: Colors.primaries[random.nextInt(Colors.primaries.length)],
          child: Center(
            child: Text(
              'Item ${_data[index] + 1}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Create a GridView.builder that displays a grid of items. When an item is tapped, it should display an alert dialog with the item’s index or other details.
class TappableGridView extends StatelessWidget {
  const TappableGridView({super.key});
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tappable GridView"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Item Tapped'),
                    content: Text('You tapped on item ${index + 1}.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              color: Colors.primaries[random.nextInt(Colors.primaries.length)],
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
