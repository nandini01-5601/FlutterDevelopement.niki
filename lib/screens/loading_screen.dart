import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//we use as keyword to give a name to the package of http;
//since the http package has no classes as such ,so to give a proper reference we name it

const apiKey = '8c7fb782a31f94d90dc33f869de7b54d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  void getLocation() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    latitude = currentLocation.longitude;
    longitude = currentLocation.latitude;
    getData();
  }
  
  void getData() async {
    http.Response response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    if(response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double temperature = decodedData['main']['temp'];
      String city = decodedData['name'];
      int id = decodedData['weather'][0]['id'];

      print(temperature);
      print(id);
      print(city);
    }
    else {
      print(response.statusCode);
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // getLocation();
          },
          child: Text(
            'Click here',
          ),
        ),
      ),
    );
  }
}