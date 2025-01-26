import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Paginator(),
    );
  }
}

class Paginator extends StatefulWidget {
  const Paginator({super.key});

  @override
  State<Paginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<Paginator> {
  final List<int> _data = List.generate(20, (index) => index); // Initial data

  void _loadMoreData() {
    setState(() {
      _data.addAll(List.generate(10, (index) => _data.length + index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Flutter Paginator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            // User has reached the end of the list
            // Load more data or trigger pagination in flutter
            _loadMoreData();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _data.length + 1, // Add 1 for loading indicator
          itemBuilder: (context, index) {
            if (index < _data.length) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                title: Text('Item ${_data[index] + 1}'),
                trailing: Icon(Icons.arrow_right_alt_sharp),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
