import 'package:exam_halls/models/database.dart';
import 'package:exam_halls/screens/institute/institute_dash.dart';
import 'package:exam_halls/screens/student/student_dash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String name, email, mobile, pincode, password, college="", degree="", dept="", sem="", reg="";
  int acctype=0;

  @override
  void initState(){
    super.initState();
    acctype = 0;
  }

  setacctype(int val){
    setState(() {
      acctype = val;
    });
  }

  void valuecheck(){
    Fluttertoast.showToast(
        msg: "Select an Account Type!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void createacc(){
    String uid = auth.currentUser.uid;
    addUser(name, email, mobile, pincode, acctype, college, degree, dept, sem, reg, uid);
    if(acctype==1)
      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDash(uid)));
    else if(acctype==2)
      Navigator.push(context, MaterialPageRoute(builder: (context) => InstituteDash(uid)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register")),
        body:
        ListView(
            children: <Widget>
            [
              Text("SignUp", textScaleFactor: 2, textAlign: TextAlign.center),
              TextField(keyboardType: TextInputType.name, decoration: InputDecoration(labelText: "Name"), onChanged: (value) => name = value),
              TextField(keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: "Email"), onChanged: (value) => email = value),
              TextField(keyboardType: TextInputType.phone ,decoration: InputDecoration(labelText: "Mobile No"), onChanged: (value) => mobile = value),
              TextField(decoration: InputDecoration(labelText: "Pin Code"), onChanged: (value) => pincode = value),
              TextField(obscureText: true, decoration: InputDecoration(labelText: "Create Password"), onChanged: (value) => password = value),
              Text("\n"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>
                  [
                    Column(
                        children: <Widget>
                        [
                          Text("\nStudent", textScaleFactor: 1.5),
                          Radio(value: 1, groupValue: acctype, onChanged: (val){setacctype(val);}),
                        ]
                    ),
                    Column(
                        children: <Widget>
                        [
                          Text("\nInstitute", textScaleFactor: 1.5),
                          Radio(value: 2, groupValue: acctype, onChanged: (val){setacctype(val);}),
                        ]
                    )
                  ]
              ),
              (acctype==1)? TextField(decoration: InputDecoration(labelText: "College/University"), onChanged: (value) => college = value): Text(" "),
              (acctype==1)? TextField(decoration: InputDecoration(labelText: "Degree"), onChanged: (value) => degree = value): Text(" "),
              (acctype==1)? TextField(decoration: InputDecoration(labelText: "Department"), onChanged: (value) => dept = value): Text(" "),
              (acctype==1)? TextField(decoration: InputDecoration(labelText: "Semester"), onChanged: (value) => sem = value): Text(" "),
              (acctype==1)? TextField(decoration: InputDecoration(labelText: "Register Number"), onChanged: (value) => reg = value): Text(" "),
              (acctype==1)? Text("\n\n"):Text(""),
              TextButton(
                  child: Text("SignUp"),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.purple,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      )
                  ),
                  onPressed: () async{
                    if(acctype==0)
                      valuecheck();
                    else
                      try {
                        await auth.createUserWithEmailAndPassword(email: email, password: password);
                        this.createacc();
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                          Fluttertoast.showToast(
                              msg: "The password provided is too weak.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                          Fluttertoast.showToast(
                              msg: "The account already exists for that email.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                    } catch (e) {print(e);}
                  }
              ),
              Text("\n\n\n")
            ]
        )
    );
  }
}