
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {

  @override
  _EmployeeScreenState createState() => new _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


//
//  bool rightData = false;
//  DatabaseHelper db = new DatabaseHelper();

  TextEditingController _ageController;
  TextEditingController _nameController;
  TextEditingController _departmentController;
  TextEditingController _cityController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ageController = new TextEditingController();
    _nameController = new TextEditingController();
    _departmentController =
        new TextEditingController();
    _cityController = new TextEditingController();
    _descriptionController =
        new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,

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
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5.0)),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Full Name ',
                      icon: Icon(Icons.person),
                      hintText: 'Input your Full name ',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      icon: Icon(Icons.calendar_today),
                      hintText: 'Input your Age ',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  TextFormField(
                    controller: _departmentController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Adress',
                      icon: Icon(Icons.email),
                      hintText: 'Input your Email Adress ',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'City',
                      icon: Icon(Icons.location_city),
                      hintText: 'Input your City ',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  TextFormField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Specialist',
                      icon: Icon(Icons.work),
                      hintText: 'Input your Specialist ',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
//                      Checkbox(
//                        value: rightData,
//                        onChanged: (bool value) {
//                          setState(() {
//                            rightData = value;
//                          });
//                        },
//                      ),
//                      Text(
//                        'All Fieled Data is correct',
//                        style: TextStyle(
//                          fontSize: 20,
//                        ),
//                      ),
                    ],
                  ),
                  RaisedButton(
                    child:  Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),

                    color: Colors.blueAccent,
                    onPressed: () {
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();

                      Firestore.instance.collection('Users').document().setData({
                        'Name': _nameController.text,
                        'Age':_ageController.text,
                        "EmailAdress": _departmentController.text ,
                        'City': _cityController.text,
                        'Specialist':_descriptionController.text
                        });

                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          )
        ));
  }
}