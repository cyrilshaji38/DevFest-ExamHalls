import 'package:exam_halls/screens/institute/institute_wall.dart';
import 'package:exam_halls/screens/student/student_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String uid_cusat = "S6lyT1XiKmhRqC2JLwW4C3LiQxf1", uid_tec = "Diops5YDxbWK6opGkBQJ6dY4Fx33";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: StudentDrawer()),
        appBar: AppBar(title: Text("Search for nearby centers")),
        body: Center(
          child: Column(children: <Widget>[
            TextField(decoration: InputDecoration(labelText: "Search Pincode/University Name:")),
            IconButton(icon: Icon(Icons.search_sharp, size: 30), onPressed: (){}),
            Text("\n"),
            Text("Recent Searches:",textScaleFactor: 2),
            SizedBox(
              width: 350,
              child: TextButton(
                  child: Text("682022: School of Engineering, CUSAT"),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => InstituteWall(uid_cusat)));},
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.grey,
                      textStyle: TextStyle(color: Colors.black, fontSize: 15),
                  )
              ),
            ),
            SizedBox(
              width: 350,
              child: TextButton(
                  child: Text("680009: Thrissur Engineering College"),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => InstituteWall(uid_tec)));},
                  style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.grey,
                      textStyle: TextStyle(color: Colors.black, fontSize: 15,),
                  )
              ),
            ),
          ]),
        )
    );
  }
}