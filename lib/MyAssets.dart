import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileApp(),
    );
  }
}

// Create profile app with your photo, name, address, and phone number. Use local fonts to style the text
class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile App")),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/v2/D4D03AQFzYRxZqQpRYQ/profile-displayphoto-shrink_200_200/B4DZQCSqQkG0AY-/0/1735205235399?e=2147483647&v=beta&t=8Pp9xEqxBVWaK8PZHcOve3eKcI2bL_dw7rUIyL7XgMI',
              ),
            ),
            Text(
              "Dishang H. Rana",
              style: TextStyle(
                fontFamily: 'GastrolineSignature',
                fontSize: 25,
              ),
            ),
            Text(
              "Address: Surat, Gujarat",
              style: GoogleFonts.amarante(fontWeight: FontWeight.w400),
            ),
            Text(
              "Contact Info: +91 99786 68784",
              style: GoogleFonts.mukta(),
            )
          ],
        ),
      ),
    );
  }
}
