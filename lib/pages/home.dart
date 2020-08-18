import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; //args returns a map

  @override
  Widget build(BuildContext context) {
    // How to recieve the arguments sent from the loading state
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    //background image
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDayTime': result['isDayTime'],
                    'flag': result['flag']
                  };
                });
              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.grey[300],
              ),
              label: Text(
                "Edit Location",
                style: TextStyle(color: Colors.grey[300]),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                      color: Colors.white, fontSize: 28.0, letterSpacing: 2.0),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              data['time'],
              style: TextStyle(
                  color: Colors.white, fontSize: 65.0, letterSpacing: 2.0),
            )
          ]),
        ),
      )),
    );
  }
}
