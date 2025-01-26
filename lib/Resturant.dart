// Create a restaurant app that displays a list of dishes. Each dish should have a name, description, and price.
import 'package:flutter/material.dart';

void main() {
  runApp(Resturant());
}

class Resturant extends StatelessWidget {
  const Resturant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Resturant App",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Image.network(
                'https://www.vegrecipesofindia.com/wp-content/uploads/2010/07/hyderabadi-vegetable-dum-biryani-recipe-11.jpg',
              ),
              title: Text("Veg Dum Biryani"),
              subtitle: Text(
                  "A true Veg Biryani is always prepared with slow cooking on dum."),
              trailing: Text("350₹"),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Image.network(
                'https://www.vegrecipesofindia.com/wp-content/uploads/2017/01/rajma-masala-veg-recipes-7.jpg',
              ),
              title: Text("Rajma Masala"),
              subtitle: Text(
                  "Rajma Masala is one of the regulars at any Punjabi house for lunch or dinner."),
              trailing: Text("150₹"),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Image.network(
                'https://www.vegrecipesofindia.com/wp-content/uploads/2014/05/paneer-butter-masala-1a.jpg',
              ),
              title: Text("Paneer Buttur Masala"),
              subtitle: Text(
                  "Paneer Butter Masala is a traditional North Indian dish featuring a rich, creamy gravy made from tomatoes, butter, and flavorful spices."),
              trailing: Text("250₹"),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Image.network(
                'https://www.vegrecipesofindia.com/wp-content/uploads/2009/07/sambar.jpg',
              ),
              title: Text("Sambar"),
              subtitle: Text(
                  "Sambar is a South Indian lentil and vegetable stew made with tamarind and a unique spice blend called sambar powder."),
              trailing: Text("70₹"),
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
