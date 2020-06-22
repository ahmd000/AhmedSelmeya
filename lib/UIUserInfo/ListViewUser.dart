import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterahmedsilmia/UIUserInfo/UpdateUsers.dart';
 import 'package:flutterahmedsilmia/model/Users.dart';

import 'AddAndUpdateUsers.dart';
import 'UserInfo.dart';

class ListViewEmployees extends StatefulWidget {
  static String id = 'ListViewEmployees';
  @override
  _ListViewEmployeesState createState() => new _ListViewEmployeesState();
}

class _ListViewEmployeesState extends State<ListViewEmployees> {

  @override
  Widget build(BuildContext context) {
    Users users = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
        title: 'All Employees',
        home: Scaffold(
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
            title: Text('All Users'),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('Users').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  List<Users> users = [];
                  if (snapshot.hasData) {
                    for (var doc in snapshot.data.documents) {
                      var data = doc.data;
                      users.add(Users(
                          uId: doc.documentID,
                          uName: data["Name"],
                          uAge: data['Age'],
                          uEmailAdress: data['EmailAdress'],
                          uCity: data['City'],
                          uSpecialist: data['Specialist']));
                    }
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      return ListView.builder(
                          itemCount: users.length,
                          padding: const EdgeInsets.all(15.0),
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Divider(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    new Expanded(
                                        child: ListTile(
                                          title: Text(
                                            '${users[index].uName}',
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                color: Colors.redAccent),
                                          ),
                                          subtitle: Text(
                                            '${users[index].uEmailAdress}',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          leading: Column(
                                            children: <Widget>[
                                              Padding(
                                                  padding:
                                                  EdgeInsets.all(1.0)),
                                            ],
                                          ),
                                            onTap: () {
                                              Navigator.pushNamed(context, DataInformation.id,
                                                  arguments: users[index]);
                                            }

                                        )

                                    ),
//                                    IconButton(
//                                        icon: Icon(
//                                          Icons.edit,
//                                          color: Colors.blueAccent,
//                                        ),
//                                        onPressed: () {
//                                          Navigator.pushNamed(context, UpdateUser.id,
//                                              arguments: users[index].uId);
//
//
//
//
//
//
//                                        }),
                                    IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {

                                          deleteProduct(users[index].uId);


                                        })
                                  ],
                                ),
                              ],
                            );

                          });
                  }
                }),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secanimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.elasticInOut);
                          return ScaleTransition(
                            scale: animation,
                            alignment: Alignment.center,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secanimation) =>
                            EmployeeScreen()));
              }),
        ));
  }




}


deleteProduct(documentId) {
  Firestore.instance.collection('Data').document(documentId).delete();
}


