import 'package:flutter/material.dart';
import 'package:flutterahmedsilmia/model/Users.dart';



class DataInformation extends StatefulWidget{
  static String id = 'DataInformation';

  @override
  _userInfoState createState() => new _userInfoState();

}

class _userInfoState extends State<DataInformation> {


  @override
  Widget build(BuildContext context) {


    Users users = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/HomeScreen');
            },
          )
        ],
        title: Text('User Information') ,

      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),



        margin: EdgeInsets.only(top: 20, right: 20, left: 20 ),
         padding:EdgeInsets.only(top: 20, right: 20, left: 20 ) ,
         height: 350,

         alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           Center(  child:    Text('User Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  )

              ),


            Padding(padding: EdgeInsets.all(20.0)),
            Text('name : ${users.uName}',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text('Age: ${users.uAge}',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text('Email Adress: ${users.uEmailAdress}',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text('City: ${users.uCity}',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text('Specialization: ${users.uSpecialist}',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 22.0,
              ),   maxLines: 10,),



          ],
        ),










      ),
    );
  }
}