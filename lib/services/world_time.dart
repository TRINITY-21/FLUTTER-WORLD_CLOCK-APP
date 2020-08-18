//import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // UI location
  String time; // Time in that location
  String flag; // url to an image flag icon
  String url; // location url for api
  bool isDayTime; //toggle mode

  WorldTime({this.location, this.flag, this.url}); //Named constructor

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //getting props from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      //print(offset);

      ///create a date time object

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now); // set time props to string

      isDayTime = now.hour > 6 && now.hour < 20  ? true : false;



    } catch (e) {
      time = 'Could not get time data';
    }
  }
}
