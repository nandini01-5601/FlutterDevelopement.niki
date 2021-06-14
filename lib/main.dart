import 'package:firebase_core/firebase_core.dart';
import 'package:pblcanteen/login_page.dart';
import 'package:pblcanteen/next.dart';
import 'package:pblcanteen/signup_page.dart';
import 'package:pblcanteen/welcome_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DigiCanteen());
}

class DigiCanteen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //initial route
        '/': (context) => WelcomePage(),
        //next
        '/login': (context) => LoginPage(),
        //next
        '/Signup': (context) => SignUp(),
        '/next': (context) => Next(),
      },
    );
  }
}

