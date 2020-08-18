import 'package:flutter/material.dart';
import 'package:Demo/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Ghana', flag: 'ghana.png', url: 'Africa/Accra');
    await instance.getTime(); // executes the worldtime func
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
            child:SpinKitChasingDots(
                color: Colors.white,
                
                size: 50.0,
              ),
      
      ),
    );
  }
}
