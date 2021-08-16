import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(name1, email1, mobile1, pincode1, acctype1, college1, degree1, dept1, sem1, reg1, uid1) async{
  return users.doc(uid1).set({
    'Name': name1,
    'Email': email1,
    'Mobile No': mobile1,
    'Pincode': pincode1,
    'Account Type': acctype1,
    'College': college1,
    'Degree': degree1,
    'Department': dept1,
    'Semester': sem1,
    'Register Number': reg1,
    'uid': uid1,
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}