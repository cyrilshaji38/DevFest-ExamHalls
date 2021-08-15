import 'package:exam_halls/screens/institute/institute_drawer.dart';
import 'package:exam_halls/screens/login.dart';
import 'package:flutter/material.dart';

class InstituteDash extends StatefulWidget {
  const InstituteDash({Key key}) : super(key: key);

  @override
  _InstituteDashState createState() => _InstituteDashState();
}

class _InstituteDashState extends State<InstituteDash> {

  void logout() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Text("${data['Name']}",
              //     textScaleFactor: 3, textAlign: TextAlign.center),
              // Text(
              //     "\nemail: ${data['Email']} \nMobile No: ${data['Mobile No']} \nPin Code: ${data['Pincode']}",
              //     textScaleFactor: 1.5),
            ])
        )
    );
  }
}