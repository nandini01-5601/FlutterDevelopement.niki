import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; //true or false if daytime or not

  //constructor
  WorldTime({this.location , this.flag , this.url});

  //the async keyword shows that the given function is asynchronous
  //and that the next code can keep running until the request is going on.
  Future<void> getData() async {
    //simulate network request for a username
    //if we dont use the keyword await ,
    //then the delay for the first request will go on
    //and while that happens , the next code will keep on running.
    //but if we need the data sent by the first request ,
    //to go for the second request , this wont work,
    //so we use word await.
    //The returned result can be stored in the form of variable too.
    /*String username = await Future.delayed(Duration(seconds: 3), () {
      return 'niki';
    });
    //simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 3), () {
      return 'Foodie , cute , good , kind';
    });
    print('$username - $bio');*/

    /*Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);*/

    //actual one
    //make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    print(datetime);

    //create DateTime object.
    DateTime now = DateTime.parse(datetime);
    //print(now);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);

    isDaytime = now.hour>6 && now.hour<19 ? true : false;
    time = DateFormat.jm().format(now);
  }
}

