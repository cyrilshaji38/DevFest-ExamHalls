import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_halls/models/database.dart';
import 'package:exam_halls/screens/login.dart';
import 'package:exam_halls/screens/student/student_drawer.dart';
import 'package:flutter/material.dart';

class StudentDash extends StatefulWidget {

  final String documentId;
  StudentDash(this.documentId);
  // const StudentDash({Key key}) : super(key: key);

  @override
  _StudentDashState createState() => _StudentDashState();
}

class _StudentDashState extends State<StudentDash> {

  void logout() {
    {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
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
                  drawer: Drawer(child: StudentDrawer()),
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
                        Text("\nemail: ${data['Email']} \n\nMobile No: ${data['Mobile No']} \n\nPin Code: ${data['Pincode']} \n\nCollege: ${data['College']} \n\nDegree: ${data['Degree']} \n\nDepartment: ${data['Department']} \n\nSemester: ${data['Semester']} \n\nRegister Number: ${data['Register Number']}", textScaleFactor: 1.5),
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