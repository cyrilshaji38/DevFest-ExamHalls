import 'package:exam_halls/screens/student/classrooms/PDF_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EMI extends StatefulWidget {
  const EMI({Key key}) : super(key: key);

  @override
  _EMIState createState() => _EMIState();
}

class _EMIState extends State<EMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Exam Center")),
        body: Center(
          child: Column(children: <Widget>[
            Text("S6-ECE: Electronic Measurements and Instrumentation",textScaleFactor: 2.5, textAlign: TextAlign.center,),
            Text("\n"),
            Row(children:<Widget>[
              Text("\t\t\t\t\t\t"),
              Container(color: Colors.grey, child: IconButton(icon : Icon(Icons.upload_sharp,size: 40), onPressed: ()=>{})),
              Text(" Upload Hall Ticket",textScaleFactor: 2,)
            ]),
            Text("\n"),
            Row(children:<Widget>[
              Text("\t\t\t\t\t\t"),
              Container(color: Colors.grey, child: IconButton(icon : Icon(Icons.location_on,size: 40), onPressed: ()=>{})),
              Text(" Upload My location",textScaleFactor: 2)
            ]),
            Text("\n"),
            SizedBox(
              width: 350,
              height: 100,
              child: TextButton(
                  child: Text("View Question Paper"),
                  onPressed: ()=>{},
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.purple,
                      textStyle: TextStyle(color: Colors.white, fontSize: 20,)
                  )
              ),
            ),
            Text("\n"),
            Row(children:<Widget>[
              Text("\t\t\t\t\t\t"),
              Container(color: Colors.grey, child: IconButton(icon : Icon(Icons.upload_sharp,size: 40), onPressed: (){scan();})),
              Text(" Upload Answers",textScaleFactor: 2)
            ])
          ]),
        ),
    );
  }
}