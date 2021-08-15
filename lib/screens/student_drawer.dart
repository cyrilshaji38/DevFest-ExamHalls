import 'package:exam_halls/screens/classrooms.dart';
import 'package:exam_halls/screens/search.dart';
import 'package:exam_halls/screens/student_dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentDrawer extends StatefulWidget {
  const StudentDrawer({Key key}) : super(key: key);

  @override
  _StudentDrawerState createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {

  void dash(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDash()));
  }

  void search(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
  }

  void classrooms(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ClassroomsPage()));
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
            child: Text("Search"),
            onPressed: this.search,
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purple,
                textStyle: TextStyle(color: Colors.white, fontSize: 30,)
            )
        ),
      ),
      Text("\n"),
      SizedBox(
        width: 300,
        child: TextButton(
            child: Text("Classrooms"),
            onPressed: this.classrooms,
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.purple,
                textStyle: TextStyle(color: Colors.white, fontSize: 30,)
            )
        ),
      )
    ]);
  }
}