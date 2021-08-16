import 'package:exam_halls/screens/student/student_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key key}) : super(key: key);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: StudentDrawer()),
        appBar: AppBar(title: Text("Payments")),
        body: Center(
          child: Column(children: <Widget>[
            Text("\nNo Dues!", textScaleFactor: 2,)
          ]),
        )
    );
  }
}
