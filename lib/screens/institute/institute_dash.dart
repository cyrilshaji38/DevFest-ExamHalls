import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_halls/models/database.dart';
import 'package:exam_halls/screens/institute/institute_drawer.dart';
import 'package:exam_halls/screens/login.dart';
import 'package:flutter/material.dart';

class InstituteDash extends StatefulWidget {

  final String documentId;
  InstituteDash(this.documentId);
  // const InstituteDash({Key key}) : super(key: key);

  @override
  _InstituteDashState createState() => _InstituteDashState();
}

class _InstituteDashState extends State<InstituteDash> {

  void logout() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return new WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                  drawer: Drawer(child: InstituteDrawer()),
                  appBar: AppBar(title: Text("Dashboard"), actions: <Widget>[
                    TextButton(
                      onPressed: this.logout,
                      child: Row(children: <Widget>[
                        Text('Logout '),
                        Icon(Icons.logout)
                      ]),
                      style: TextButton.styleFrom(primary: Colors.white),
                    )
                  ]),
                  body: Align(
                      alignment: Alignment.topLeft,
                      child: ListView(children: <Widget>[
                        Text("${data['Name']}", textScaleFactor: 3, textAlign: TextAlign.center),
                        Text("\nemail: ${data['Email']} \n\nMobile No: ${data['Mobile No']} \n\nPin Code: ${data['Pincode']} \n\nTotal Seat Capacity: 500 \n\nAvailable Seats: 174 \n\nTime Slots: \n1) 8am-1pm \n2) 2pm-6pm \n\nBookings open: 01/02/22 to 01/04/22", textScaleFactor: 1.5),
                      ])
                  )
              )
          );
        }

        return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }
}