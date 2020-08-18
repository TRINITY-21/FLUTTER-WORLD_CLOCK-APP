import 'package:flutter/material.dart';
import 'package:Demo/pages/home.dart';
import 'package:Demo/pages/loading.dart';
import 'package:Demo/pages/location.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,  
      initialRoute: '/home',   
      
      routes:{
        '/':(context)=>Loading(),
        '/home':(context) => Home(),
        '/location':(context)=> Locations(),
      }

));


