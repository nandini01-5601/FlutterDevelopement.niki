import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:pblcanteen/ud_widgets/welcomeButton.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('images/frontfood.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Welcome to Digital Canteen !',
                    style: kWelcomeTextStyleHeading,
                  ),
                  // SizedBox(height: 20.0),
                  Column(
                    children: [
                      Text(
                        'Order from anywhere',
                        style: kWelcomeTextStyleContent,
                      ),
                      Text(
                        'in and out of the campus!',
                        style: kWelcomeTextStyleContent,
                      ),
                    ],
                  ),
                  // SizedBox(height: 80.0),
                  WelcomeButton(
                    height: 50.0,
                    width: 300.0,
                    text: 'Login',
                    buttonColor: Colors.red,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  // SizedBox(height: 30.0),
                  WelcomeButton(
                    height: 50.0,
                    width: 300.0,
                    buttonColor: Colors.red,
                    text: 'SignUp',
                    onPressed: () {
                      Navigator.pushNamed(context, '/Signup');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


