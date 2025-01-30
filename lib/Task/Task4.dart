import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}

// Create a Flutter application with a form that includes text fields for name, email, and phone number. Use custom styling for the form fields.
class CustomFormScreen extends StatefulWidget {
  const CustomFormScreen({super.key});

  @override
  State<CustomFormScreen> createState() => _CustomFormScreenState();
}

class _CustomFormScreenState extends State<CustomFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Fill in the details below:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              ElevatedButton(child: const Text('Submit'), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a screen with a variety of buttons (e.g., raised, flat, icon, and floating action buttons) demonstrating different styles and functionalities.
class AllButton extends StatelessWidget {
  const AllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Different Type Of Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Text("Material Button"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Elevated Button"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Text Button"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text("Outlined Button"),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.star),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Text("+"),
            ),
          ],
        ),
      ),
    );
  }
}

// Implement a table in Flutter displaying a list of products with columns for product name, price, and quantity. Include functionality to sort the table by each column.
class Product {
  final String name;
  final num quantity, price;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class ProductTable extends StatefulWidget {
  const ProductTable({super.key});

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  final List<Product> _products = [
    Product(name: 'Laptop', price: 1200, quantity: 10),
    Product(name: 'Mouse', price: 25, quantity: 50),
    Product(name: 'Keyboard', price: 45, quantity: 30),
    Product(name: 'Monitor', price: 300, quantity: 15),
    Product(name: 'Headphones', price: 75, quantity: 25),
  ];

  bool _isAscending = true;
  int? _sortColumnIndex;

  // sort data function
  void _sortTable(int columnIndex, bool ascending) {
    setState(() {
      _isAscending = ascending;
      _sortColumnIndex = columnIndex;

      if (columnIndex == 0) {
        // Sort by first column
        _products.sort((a, b) =>
            ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
      } else if (columnIndex == 1) {
        // Sort by second column
        _products.sort((a, b) => ascending
            ? a.price.compareTo(b.price)
            : b.price.compareTo(a.price));
      } else if (columnIndex == 2) {
        // Sort by third column
        _products.sort((a, b) => ascending
            ? a.quantity.compareTo(b.quantity)
            : b.quantity.compareTo(a.quantity));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: DataTable(
        sortAscending: _isAscending,
        sortColumnIndex: _sortColumnIndex,
        columns: [
          DataColumn(
            label: const Text('Product Name'),
            onSort: (index, ascending) {
              _sortTable(index, ascending);
            },
          ),
          DataColumn(
            label: const Text('Price'),
            numeric: true,
            onSort: (index, ascending) {
              _sortTable(index, ascending);
            },
          ),
          DataColumn(
            label: const Text('Quantity'),
            numeric: true,
            onSort: (index, ascending) {
              _sortTable(index, ascending);
            },
          ),
        ],
        rows: _products
            .map(
              (product) => DataRow(
                cells: [
                  DataCell(Text(product.name)),
                  DataCell(Text(product.price.toString())),
                  DataCell(Text(product.quantity.toString())),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

// Design a form with validation that includes fields for user registration: username, password, confirm password, and email. Display appropriate error messages for invalid inputs.
// Construct a dynamic form in Flutter that adds a new text field every time the user presses an ‘Add’ button. Include a ‘Submit’ button to display all entered data in a dialog box.
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // FormKey for the main form
  final _formKey = GlobalKey<FormState>();

  // Controllers for fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  // List of dynamic text fields
  final List<TextEditingController> _dynamicControllers = [];

  // Add a new dynamic field
  void _addDynamicField() {
    setState(() {
      _dynamicControllers.add(TextEditingController());
    });
  }

  // Submit the form and show a dialog with the entered data
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String dynamicData = _dynamicControllers
          .asMap()
          .entries
          .map((entry) => "Field ${entry.key + 1}: ${entry.value.text}")
          .join('\n');

      String result =
          '''Username: ${_usernameController.text}\nEmail: ${_emailController.text}\nPassword: ${_passwordController.text}\nDynamic Fields:$dynamicData''';

      // Show the result in a dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Form Data'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username field
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password field
              TextFormField(
                controller: _confirmPasswordController,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Dynamic fields section
              const Text(
                'Additional Fields:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ..._dynamicControllers.map((controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText:
                          'Dynamic Field ${_dynamicControllers.indexOf(controller) + 1}',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                );
              }),

              // Add button for dynamic fields
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: _addDynamicField,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Field'),
                ),
              ),
              const SizedBox(height: 16),

              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a responsive Flutter layout with a table on a large screen (e.g., tablet or desktop) and a list view on smaller screens (e.g., mobile), containing the same data.
class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  // list of data
  final List<Map<String, dynamic>> _data = const [
    {"id": 1, "name": "Product A", "price": 10.0, "quantity": 100},
    {"id": 2, "name": "Product B", "price": 20.0, "quantity": 50},
    {"id": 3, "name": "Product C", "price": 15.5, "quantity": 75},
    {"id": 4, "name": "Product D", "price": 12.0, "quantity": 40},
    {"id": 5, "name": "Product E", "price": 25.0, "quantity": 30},
  ];

  @override
  Widget build(BuildContext context) {
    // screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout'),
      ),
      body: screenWidth >= 600
          ? _buildTableView() // Show table for large screens
          : _buildListView(), // Show list for small screens
    );
  }

  Widget _buildTableView() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Quantity')),
      ],
      rows: _data
          .map(
            (item) => DataRow(
              cells: [
                DataCell(Text(item['id'].toString())),
                DataCell(Text(item['name'])),
                DataCell(Text('${item['price'].toStringAsFixed(2)}')),
                DataCell(Text(item['quantity'].toString())),
              ],
            ),
          )
          .toList(),
    );
  }

  // List View for smaller screens
  Widget _buildListView() {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        final item = _data[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(item['id'].toString()),
            ),
            title: Text(item['name']),
            subtitle: Text(
                'Price: ${item['price'].toStringAsFixed(2)}\nQuantity: ${item['quantity']}'),
          ),
        );
      },
    );
  }
}

// Create a multi-step form in Flutter where each step is a different page in a PageView. Include ‘Next’ and ‘Previous’ buttons to navigate between the steps.
class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Move to the next page
  void _nextPage() {
    if (_formKey.currentState?.validate() ?? false) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.slowMiddle,
      );
    }
  }

  // Move to the previous page
  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.slowMiddle,
    );
  }

  // Submit the form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Form Submitted'),
          content: Text(
            'Name: ${_nameController.text}\nEmail: ${_emailController.text}\nPassword: ${_passwordController.text}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Step Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // PageView for multi-step form
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  // Step 1: Name
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Step 1: Enter Name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Name should not be blank';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  // Step 2: Email
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Step 2: Enter Email',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email should not be blank';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  // Step 3: Password
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Step 3: Enter Password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Password should not be blank';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    ElevatedButton(
                      onPressed: _previousPage,
                      child: const Text('Previous'),
                    ),
                  if (_currentPage < 2)
                    ElevatedButton(
                      onPressed: _nextPage,
                      child: const Text('Next'),
                    ),
                  if (_currentPage == 2)
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Implement a custom button in Flutter that changes its color and elevation when pressed, with a smooth animation transition.
class CustomButtonDemo extends StatelessWidget {
  const CustomButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animated Button'),
      ),
      body: Center(
        child: CustomAnimatedButton(),
      ),
    );
  }
}

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blueAccent : Colors.green,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(),
              offset: Offset(0, _isPressed ? 2 : 6),
              blurRadius: _isPressed ? 4 : 12,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Custom Button',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

// Create a Flutter application that uses a DataTable widget to display user data fetched from a mock JSON API. Include features for pagination and row selection.
class UserDataTableScreen extends StatefulWidget {
  const UserDataTableScreen({super.key});

  @override
  State<UserDataTableScreen> createState() => _UserDataTableScreenState();
}

class _UserDataTableScreenState extends State<UserDataTableScreen> {
  // mock api url
  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  // List of map
  List<Map<String, dynamic>> _userData = [];

  final int _rowsPerPage = 5;
  int _currentPage = 0;

  // Fetch data from API
  Future<void> _fetchUserData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        setState(() {
          _userData = data
              .map((user) => {
                    'id': user['id'],
                    'name': user['name'],
                    'email': user['email'],
                  })
              .toList();
        });
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    // logic for show current page data
    final currentPageData =
        _userData.skip(_currentPage * _rowsPerPage).take(_rowsPerPage).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data Table'),
      ),
      body: _userData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                  ],
                  rows: currentPageData
                      .map(
                        (user) => DataRow(
                          cells: [
                            DataCell(Text(user['id'].toString())),
                            DataCell(Text(user['name'])),
                            DataCell(Text(user['email'])),
                          ],
                        ),
                      )
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Page: ${_currentPage + 1}'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _currentPage > 0
                              ? () {
                                  setState(() {
                                    _currentPage--;
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: (_currentPage + 1) * _rowsPerPage <
                                  _userData.length
                              ? () {
                                  setState(() {
                                    _currentPage++;
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

// Create a sign-in form in Flutter with animated transitions between the ‘Sign In’ and ‘Sign Up’ forms, showcasing a smooth user experience.
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;

  void _toggleForm() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In & Sign Up'),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInCubic,
          switchOutCurve: Curves.easeOutCubic,
          child: _isSignIn
              ? SignInForm(
                  key: const ValueKey('SignInForm'),
                  onSwitch: _toggleForm,
                )
              : SignUpForm(
                  key: const ValueKey('SignUpForm'),
                  onSwitch: _toggleForm,
                ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  final VoidCallback onSwitch;

  const SignInForm({super.key, required this.onSwitch});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign In Successful!')),
                  );
                }
              },
              child: const Text('Sign In'),
            ),
            TextButton(
              onPressed: widget.onSwitch,
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  final VoidCallback onSwitch;

  const SignUpForm({super.key, required this.onSwitch});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign Up Successful!')),
                  );
                }
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: widget.onSwitch,
              child: const Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
