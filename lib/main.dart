import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';

void main() => runApp(MaterialApp(
  //this is used because the home widget collides with the
  //initial route specified below
  //initialRoute: '/home',
  //this basically sets the map(key value pair(same as dictonary in python))
  routes: {
    //initial route
    '/': (context) => Loading(),
    //next
    '/home': (context) => Home(),
    //next
    '/location': (context) => ChooseLocation(),
  },
));
