import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:pblcanteen/ud_widgets/welcomeButton.dart';
import 'package:pblcanteen/ud_widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  UserCredential userCredential;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Login',
              style: kLoginHeadingTextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  InputField(
                    controller: _email,
                    obscureText: false,
                    text: 'E-mail',
                    icon: Icons.person_outline_outlined,
                    iconColor: Colors.grey,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Please enter E-Mail';
                      }
                      if(!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
                        return 'Please enter valid email';
                      }
                    },
                  ),
                  SizedBox(height: 30.0),
                  InputField(
                    controller: _password,
                    obscureText: true,
                    text: 'Password',
                    icon: Icons.lock_outline,
                    iconColor: Colors.grey,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            loading?CircularProgressIndicator() : Container(
              child: WelcomeButton(
                text: 'Login',
                onPressed: () async {
                  if(_formkey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    try {
                      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email.text,
                          password: _password.text
                      );
                      Navigator.of(context).pushReplacementNamed('/next');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                        loading = false;
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                        loading = false;
                      }
                    }
                    return;
                  } else {
                    return;
                  }
                },
                buttonColor: Colors.red,
                width: 200.0,
                height: 50.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New user?',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Register now!',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


