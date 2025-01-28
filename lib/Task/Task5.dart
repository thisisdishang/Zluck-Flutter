import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyButtons(),
    );
  }
}

class MyButtons extends StatefulWidget {
  const MyButtons({super.key});

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  bool _isPressed = false;
  bool _isPressed2 = false;
  String _selectedItem = "Item 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Material Button"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Create a Flutter application that displays a MaterialButton on the screen. When pressed, the button should change its color from blue to green.
            MaterialButton(
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  _isPressed = !_isPressed;
                });
              },
              color: _isPressed ? Colors.blue : Colors.green,
              child: Text("Material Button"),
            ),
            // Implement an ElevatedButton with a shadow of 10. The button should display a Snackbar with a message “ElevatedButton Pressed” when clicked.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10, shadowColor: Colors.black),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("ElevatedButton Pressed"),
                  ),
                );
              },
              child: Text("Elevated Button"),
            ),
            // Design a TextButton that toggles its text between “Enabled” and “Disabled” upon each click. Use a variable to manage the button’s state.
            TextButton(
              onPressed: () {
                setState(() {
                  _isPressed2 = !_isPressed2;
                });
              },
              child: Text(_isPressed2 ? "Disabled" : "Enabled"),
            ),
            // Create a DropdownButton with items “Item 1”, “Item 2”, and “Item 3”. Display the selected item in a Snackbar when an item is selected.
            DropdownButton(
              value: _selectedItem,
              items: <String>['Item 1', 'Item 2', 'Item 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You Select $_selectedItem"),
                  ),
                );
              },
            ),
            // Develop a PopupMenuButton that shows three menu items: “Option 1”, “Option 2”, and “Option 3”. Handle the selection and display the chosen option in a Toast or a Snackbar.
            PopupMenuButton(
              onSelected: (String result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You Select $result"),
                  ),
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Text('Option 3'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
