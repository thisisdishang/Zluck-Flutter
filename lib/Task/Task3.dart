import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../LocalJSON/localservice.dart';
import '../LocalJSON/person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiGrid(),
    );
  }
}

// Create a Flutter app that loads and displays an image from the assets folder. Ensure the image scales correctly in both portrait and landscape modes.
class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "Display Image",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain, // Ensures the image scales correctly
                width: orientation == Orientation.portrait ? 500 : 800,
                height: orientation == Orientation.portrait ? 500 : 700,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Create a Flutter application that fetches and displays an image from a URL. Implement error handling for scenarios where the image cannot be loaded.
class DisplayImageOnline extends StatelessWidget {
  const DisplayImageOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "Display Image Online",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.network(
          '',
          errorBuilder: (context, error, stackTrace) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 80,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                Text(
                  'Failed to load image:${error.runtimeType}.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Create a Flutter app that caches images from the internet and loads them from the cache on subsequent launches for faster performance.
class CachedImage extends StatelessWidget {
  const CachedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "Cached Image",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: CachedNetworkImage(
            imageUrl:
                'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png', // Verify this URL
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) {
              return Icon(Icons.error, size: 50, color: Colors.red);
            },
          ),
        ),
      ),
    );
  }
}

// Create a Flutter application that uses a custom font from the local assets and apply it to the entire app text.
class CustomApp extends StatelessWidget {
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GastrolineSignature',
      ),
      home: GoogleFont(),
    );
  }
}

class CustomFont extends StatelessWidget {
  const CustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Custom Font",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Dishang H. Rana",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Create a Flutter app that dynamically fetches and applies a Google Font to a selected text widget.
class GoogleFont extends StatelessWidget {
  const GoogleFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "Google Font",
          style: GoogleFonts.saira(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Dishang H. Rana",
                style: GoogleFonts.lacquer(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Philanthropist",
                style: GoogleFonts.sarina(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Write a Flutter application that reads a local JSON file from the assets folder and displays its contents in a user-friendly format.
class ShowJSON extends StatelessWidget {
  const ShowJSON({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local JSON'),
      ),
      body: FutureBuilder(
        future: LocalService().loadPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Person person = snapshot.data as Person;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(person.image),
                          radius: 50.0,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          person.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          person.address,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Age: ${person.age}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          person.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// Create a Flutter app that fetches JSON data from an online source and displays it in a ListView.
class DataListScreen extends StatefulWidget {
  const DataListScreen({super.key});

  @override
  State<DataListScreen> createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  List<dynamic> _data = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonguide.technologychannel.org/quotes.json'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Error: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Failed to fetch data. Please try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Quotes Data'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    final item = _data[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(item['text']),
                        subtitle: Text("- ${item['from']}"),
                      ),
                    );
                  },
                ),
    );
  }
}

// Create a Flutter app that displays a list of quotes. The quotes should be stored locally and should include functionality to add, delete, and view quotes.
class MyQuotesApp extends StatefulWidget {
  const MyQuotesApp({super.key});

  @override
  State<MyQuotesApp> createState() => _MyQuotesAppState();
}

class _MyQuotesAppState extends State<MyQuotesApp> {
  // List of quotes
  final List<String> _quotes = [
    'You are the only hope of you.',
    'This time will also pass.'
  ];

  final TextEditingController _quoteController = TextEditingController();

  void _addQuote() {
    if (_quoteController.text.isNotEmpty) {
      setState(() {
        _quotes.add(_quoteController.text);
      });
      _quoteController.clear();
      Navigator.pop(context); // Close the add quote dialog
    }
  }

  void _deleteQuote(int index) {
    setState(() {
      _quotes.removeAt(index);
    });
  }

  void _showAddQuoteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a New Quote'),
        content: TextField(
          controller: _quoteController,
          decoration: const InputDecoration(
            hintText: 'Enter your quote here',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _addQuote,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes App'),
      ),
      body: _quotes.isEmpty
          ? const Center(
              child: Text(
                'No quotes available. Add one!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _quotes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(
                      _quotes[index],
                      style: GoogleFonts.gochiHand(),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteQuote(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddQuoteDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// In a Flutter app, create a feature to switch between two sets of assets (like images and fonts) based on user selection or a toggle switch.
class UserChoice extends StatefulWidget {
  const UserChoice({super.key});

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  bool _useSetA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Switch Assets Example',
          style: TextStyle(
              fontFamily:
                  _useSetA ? 'GastrolineSignature' : 'Pacifico-Regular'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _useSetA
                ? Image.asset(
                    'assets/images/logo.png',
                    width: 500,
                    height: 500,
                  )
                : Image.asset(
                    'assets/images/logo2.png',
                    width: 500,
                    height: 500,
                  ),
          ),
          const SizedBox(height: 20),
          Text(
            'This is a sample text!',
            style: TextStyle(
                fontSize: 20,
                fontFamily:
                    _useSetA ? 'GastrolineSignature' : 'Pacifico-Regular'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Set A'),
              Switch(
                value: !_useSetA,
                onChanged: (value) {
                  setState(() {
                    _useSetA = !value; // Toggle the asset set
                  });
                },
              ),
              const Text('Set B'),
            ],
          ),
        ],
      ),
    );
  }
}

// Build a Flutter application that combines local and network images in a grid layout, demonstrating effective asset management in Flutter.
class MultiGrid extends StatelessWidget {
  const MultiGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/logo.png', // Local image
      'https://picsum.photos/200/300', // Network image
      'assets/images/logo2.png', // Local image
      'https://picsum.photos/300/400', // Network image
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Images Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            final String image = images[index];
            final bool isNetwork =
                image.startsWith('http'); // Check if it's a network image
            return Card(
              clipBehavior: Clip.hardEdge,
              child: isNetwork
                  ? Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.error)),
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
            );
          },
        ),
      ),
    );
  }
}
