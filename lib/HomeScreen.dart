import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController itemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment 1 '),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ahmad S. Abu Selmya',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            Image.asset(
              ('assets/images/unnamed.png'),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white70),
                  ),
                  child: Image.asset(
                    'assets/images/Facebook_logo.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white70),
                  ),
                  child: Image.asset(
                    'assets/images/twiter logo.jpg',
                    width: 30,
                    height: 30,
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white70),
                  ),
                  child: Image.asset(
                    'assets/images/google logo.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(20)),

            FlatButton(
              textColor: Colors.white,
              disabledColor: Colors.blue,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/ListUsers');
              },
              child: Text('Go to next Screen ', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
              color: Colors.blueAccent,

            ),

          ],
        ),
      ),
    );
  }
}
