import 'package:exam_halls/screens/institute_dash.dart';
import 'package:exam_halls/screens/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;

  void login(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => InstituteDash()));
  }

  void clickup() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Exam Hall Booking")),
        body: Column(
            children: <Widget>
            [
              Text("Login", textScaleFactor: 3),
              TextField(keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: "email"), onChanged: (value) {setState(() {_email = value.trim();});}),
              TextField(obscureText: true, decoration: InputDecoration(labelText: "password"), onChanged: (value) {setState(() {_password = value.trim();});}),
              IconButton(
                  icon: Icon(Icons.arrow_forward, size: 50),
                  onPressed: this.login
                  // () async {
                  //   try {
                  //     await auth
                  //         .signInWithEmailAndPassword(
                  //         email: _email, password: _password)
                  //         .then((_) {
                  //       this.login();
                  //     });
                  //   } on FirebaseAuthException catch (e) {
                  //     if (e.code == 'user-not-found') {
                  //       print('No user found for that email.');
                  //       Fluttertoast.showToast(
                  //           msg: "No user found for that email.",
                  //           toastLength: Toast.LENGTH_SHORT,
                  //           gravity: ToastGravity.CENTER,
                  //           timeInSecForIosWeb: 1,
                  //           backgroundColor: Colors.red,
                  //           textColor: Colors.white,
                  //           fontSize: 16.0);
                  //     } else if (e.code == 'wrong-password') {
                  //       print('Wrong password provided for that user.');
                  //       Fluttertoast.showToast(
                  //           msg: "Wrong password provided for that user.",
                  //           toastLength: Toast.LENGTH_SHORT,
                  //           gravity: ToastGravity.CENTER,
                  //           timeInSecForIosWeb: 1,
                  //           backgroundColor: Colors.red,
                  //           textColor: Colors.white,
                  //           fontSize: 16.0);
                  //     }
                  //   }
                  // }
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
    );
  }
}
