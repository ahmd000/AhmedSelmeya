
import 'package:flutter/material.dart';
import 'package:flutterahmedsilmia/UIUserInfo/AddAndUpdateUsers.dart';
import 'HomeScreen.dart';
import 'UIUserInfo/ListViewUser.dart';
import 'UIUserInfo/UserInfo.dart';
import 'UIUserInfo/UpdateUsers.dart';

void main() => runApp(new MaterialApp(
        title: 'Employees DB',
        home: HomeScreen(),
        routes:{
          '/HomeScreen': (BuildContext context) => new HomeScreen(),
          '/ListUsers': (BuildContext context) => new ListViewEmployees(),
          '/EmployeeScreen': (BuildContext context) => new EmployeeScreen(),
          DataInformation.id:  (BuildContext context) => DataInformation(),
          ListViewEmployees.id:  (context) => ListViewEmployees(),
          UpdateUser.id : (BuildContext context) => UpdateUser(),




        }));


