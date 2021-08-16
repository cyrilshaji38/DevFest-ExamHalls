import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_halls/models/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InstituteWall extends StatefulWidget {

  final String documentId;
  InstituteWall(this.documentId);
  // const InstituteDash({Key key}) : super(key: key);

  @override
  _InstituteWallState createState() => _InstituteWallState();
}

class _InstituteWallState extends State<InstituteWall> {

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
          return Scaffold(
              appBar: AppBar(title: Text("${data['Pincode']}")),
              body: Align(
                  alignment: Alignment.topLeft,
                  child: ListView(children: <Widget>[
                    Text("${data['Name']}", textScaleFactor: 3, textAlign: TextAlign.center),
                    Text("\nemail: ${data['Email']} \n\nMobile No: ${data['Mobile No']} \n\nPin Code: ${data['Pincode']} \n\nTotal Seat Capacity: 500 \n\nAvailable Seats: 174 \n\nTime Slots: \n1) 8am-1pm \n2) 2pm-6pm \n\nBookings open: 01/02/22 to 01/04/22", textScaleFactor: 1.5),
                    Text("\n"),
                    TextButton(onPressed: (){
                      Fluttertoast.showToast(
                          msg: "Request sent! You will recieve an update in payments page once the institute has accepted your request.",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      },
                        child: Text("Book a Seat"),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.purple,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )
                        )
                    )
                  ])
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