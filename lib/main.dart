import 'package:exam_halls/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Hall Booking',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Login(),
    );
  }
}