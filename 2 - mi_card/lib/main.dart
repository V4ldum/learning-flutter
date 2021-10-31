import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/picture.jpg"),
              ),
              Text(
                "Valdum",
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "POTI CHAT À PLEIN TEMPS",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.teal[100],
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.teal[100],
                thickness: 1,
                indent: 130,
                endIndent: 130,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+33 1 23 45 67 89",
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "miaou@graou.com",
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
