import 'package:exam_halls/screens/student/classrooms/S6_ECE_EMI.dart';
import 'package:exam_halls/screens/student/classrooms/S6_ECE_ITC.dart';
import 'package:exam_halls/screens/student/student_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'S6_ECE_MTD.dart';

class ClassroomsPage extends StatefulWidget {
  const ClassroomsPage({Key key}) : super(key: key);

  @override
  _ClassroomsPageState createState() => _ClassroomsPageState();
}

class _ClassroomsPageState extends State<ClassroomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: StudentDrawer()),
        appBar: AppBar(title: Text("Classrooms")),
        body: Center(
          child: Column(children: <Widget>[
            Text("\n\n"),
            SizedBox(
              width: 350,
              height: 100,
              child: TextButton(
                  child: Text("S6-ECE: Electronic Measurements and Instrumentation"),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EMI()));},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.purple,
                    textStyle: TextStyle(color: Colors.white, fontSize: 20,),
                  )
              ),
            ),
            Text("\n"),
            SizedBox(
              width: 350,
              height: 100,
              child: TextButton(
                  child: Text("S6-ECE: Information Theory and Coding"),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ITC()));},
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.purple,
                      textStyle: TextStyle(color: Colors.white, fontSize: 20,)
                  )
              ),
            ),
            Text("\n"),
            SizedBox(
              width: 350,
              height: 100,
              child: TextButton(
                  child: Text("S6-ECE: Microwave Theory and Techniques"),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MTD()));},
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.purple,
                      textStyle: TextStyle(color: Colors.white, fontSize: 20,)
                  )
              ),
            )
          ]),
        )
    );
  }
}