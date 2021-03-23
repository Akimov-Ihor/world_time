import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HoState createState() => _HoState();
}

class _HoState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              TextButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context,'/location');
                  },
                  icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),

              )
            ],
          )
      ),
    );
  }
}
