import 'package:exam_halls/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'institute_applications.dart';
import 'institute_dash.dart';

class InstituteDrawer extends StatefulWidget {
  const InstituteDrawer({Key key}) : super(key: key);

  @override
  _InstituteDrawerState createState() => _InstituteDrawerState();
}

class _InstituteDrawerState extends State<InstituteDrawer> {

  void dash(){
    String uid = auth.currentUser.uid;
    Navigator.push(context, MaterialPageRoute(builder: (context) => InstituteDash(uid)));
  }

  void applications(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("\n\n\n\n"),
      SizedBox(
        width: 300,
        child: TextButton(
            child: Text("Dashboard"),
            onPressed: this.dash,
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purple,
                textStyle: TextStyle(color: Colors.white, fontSize: 30,),
                minimumSize: Size(40,20)
            )
        ),
      ),
      Text("\n"),
      SizedBox(
        width: 300,
        child: TextButton(
            child: Text("Seat Applications"),
            onPressed: this.applications,
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purple,
                textStyle: TextStyle(color: Colors.white, fontSize: 30,),
                minimumSize: Size(40,20)
            )
        ),
      ),
    ]);
  }
}