import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_halls/models/database.dart';
import 'package:exam_halls/screens/institute/institute_dash.dart';
import 'package:exam_halls/screens/register.dart';
import 'package:exam_halls/screens/student/student_dash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;

  void login(){
    String uid = auth.currentUser.uid;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome(uid)));
  }

  void clickup() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(title: Text("Exam Hall Booking")),
          body: Column(
              children: <Widget>
              [
                Text("Login", textScaleFactor: 3),
                TextField(keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: "email"), onChanged: (value) {setState(() {_email = value.trim();});}),
                TextField(obscureText: true, decoration: InputDecoration(labelText: "password"), onChanged: (value) {setState(() {_password = value.trim();});}),
                IconButton(
                    icon: Icon(Icons.arrow_forward, size: 50),
                    onPressed: () async {
                      try {
                        await auth.signInWithEmailAndPassword(email: _email, password: _password).then((_) {
                          this.login();
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          Fluttertoast.showToast(
                              msg: "No user found for that email.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          Fluttertoast.showToast(
                              msg: "Wrong password provided for that user.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
                    }
                    ),
                Text("\n"),
                Row(
                    children: <Widget>
                    [
                      Text("Don't have an account? Signup",
                          textScaleFactor: 1.5),
                      IconButton(
                          icon: Icon(Icons.account_circle_outlined, size: 30),
                          onPressed: this.clickup)
                    ]
                )
              ]
          )
      ),
    );
  }
}

class Welcome extends StatefulWidget {

  final String documentId;
  Welcome(this.documentId);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  String acctype3;
  int acctype2;

  void clickProfile() {
    String uid = auth.currentUser.uid;
    if(acctype2 == 1)
      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDash(uid)));
    else if(acctype2 == 2)
      Navigator.push(context, MaterialPageRoute(builder: (context) => InstituteDash(uid)));
    else
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          acctype3 = "${data['Account Type']}";
          acctype2 = int.parse(acctype3);
          return new WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                  body: Center(
                    child: Column(children: <Widget>[
                      Text(
                          "\n\n\n\n\nWelcome to the Exam Hall Booking App! A platform to help educational institutions to conduct their exams in multiple centers that are near their students so that students can avoid traveling long distances.",
                          textScaleFactor: 2, textAlign: TextAlign.center),
                      Text("\n"),
                      TextButton(
                          child: Text("Dashboard"),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.purple,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              )),
                          onPressed: this.clickProfile),
                    ]),
                  )));
        }

        return Scaffold(
            body: Center(child:
            CircularProgressIndicator(),
            )
        );
      },
    );
  }
}