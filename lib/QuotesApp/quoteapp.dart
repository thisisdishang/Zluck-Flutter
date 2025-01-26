import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onlineservice.dart';
import 'quote.dart';
import 'quote_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Quote App",
            style: GoogleFonts.amarante(color: Colors.white),
          ),
        ),
        body: FutureBuilder<List<Quote>>(
          future: OnlineService().getQuotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              final quotes = snapshot.data!;
              return ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  return QuoteWidget(quote: quotes[index]);
                },
              );
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
