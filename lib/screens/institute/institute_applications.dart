import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'institute_drawer.dart';

class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({Key key}) : super(key: key);

  @override
  _ApplicationsPageState createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: InstituteDrawer()),
        appBar: AppBar(title: Text("Payments")),
        body: Center(
          child: Column(children: <Widget>[
            Text("\nNo new applicants!", textScaleFactor: 2,)
          ]),
        )
    );
  }
}
