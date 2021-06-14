import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:pblcanteen/ud_widgets/welcomeButton.dart';
import 'package:pblcanteen/ud_widgets/text_field.dart';
import 'package:pblcanteen/ud_widgets/signup_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // String _name , _email;
  bool loading = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
        child: Center(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 50.0),
              Center(
                child: Text(
                  'Sign-Up',
                  style: kLoginHeadingTextStyle,
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                height: 292.0,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SignUpInputField(
                      obscureText: false,
                      text: 'Name',
                      controller: _name,
                      validator: (String value) {
                        if(value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      onSaved: (String name) {
                        _name.text = name;
                      },
                    ),
                    // SizedBox(height: 10.0),
                    SignUpInputField(
                      obscureText: false,
                      text: 'E-Mail',
                      controller: _email,
                      validator: (String value) {
                        if(value.isEmpty) {
                          return 'Please enter E-Mail';
                        }
                        if(!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                      },
                      onSaved: (String email) {
                        _email.text = email;
                      },
                    ),
                    // SizedBox(height: 10.0),
                    SignUpInputField(
                      controller: _password,
                      obscureText: true,
                      text: 'Password',
                      validator: (String value) {
                        if(value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    // SizedBox(height: 10.0),
                    SignUpInputField(
                      controller: _confirmpassword,
                      obscureText: true,
                      text: 'Confirm Password',
                      validator: (String value) {
                        if(value.isEmpty) {
                          return 'Please re-enter password';
                        }
                        if(_password.text != _confirmpassword.text) {
                          return 'Password do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              loading?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              )
              :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WelcomeButton(
                    text: 'Cancel',
                    onPressed: () {

                    },
                    buttonColor: Colors.blueGrey,
                    width: 150.0,
                    height: 40.0,
                  ),
                  WelcomeButton(
                    text: 'Register',
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      if(_formkey.currentState.validate()) {
                        try {
                          await Firebase.initializeApp();
                          UserCredential user =
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text,
                          );
                          await FirebaseFirestore.instance.collection('Users').doc(user.user.uid).set({
                            'name': _name.text.trim(),
                            'email': _email.text.trim(),
                            'userid': user.user.uid
                          });
                          Navigator.of(context).pushReplacementNamed('/next');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                        setState(() {
                          loading = false;
                        });
                        return;
                      } else {
                        return;
                      }

                    },
                    buttonColor: Colors.red,
                    width: 150.0,
                    height: 40.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

